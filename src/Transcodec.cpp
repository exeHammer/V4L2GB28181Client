#include "TranscodeBase.hpp"

Transcodec::Transcodec(AVCodecID origin, AVCodecID transcode)
{
    m_origin.codec = avcodec_find_decoder(origin);
    m_transcode.codec = avcodec_find_encoder(transcode);
    initCodec(m_origin);
    initCodec(m_transcode);
}

Transcodec::~Transcodec()
{
    freeCodec(m_origin);
    freeCodec(m_transcode);
}

void Transcodec::initCodec(CodecInfo &info)
{
    info.pkt = av_packet_alloc();
    if (!info.pkt)
        exit(1);

    info.frame = av_frame_alloc();
    if (!info.frame)
    {
        fprintf(stderr, "Could not allocate video frame\n");
        exit(1);
    }

    info.parser = av_parser_init(info.codec->id);
    if (!info.parser)
    {
        fprintf(stderr, "parser not found\n");
        exit(1);
    }

    info.c = avcodec_alloc_context3(info.codec);
    if (!info.c)
    {
        fprintf(stderr, "Could not allocate video codec context\n");
        exit(1);
    }

    /* open it */
    if (avcodec_open2(info.c, info.codec, nullptr) < 0)
    {
        fprintf(stderr, "Could not open codec\n");
        exit(1);
    }
}

void Transcodec::freeCodec(CodecInfo &info)
{
    av_parser_close(info.parser);
    avcodec_free_context(&info.c);
    av_frame_free(&info.frame);
    av_packet_free(&info.pkt);
}

void Transcodec::inputFrame(const uint8_t *buf, int len)
{
    int ret;
    ret = av_parser_parse2(m_origin.parser, m_origin.c, &m_origin.pkt->data, &m_origin.pkt->size,
                           buf, len, AV_NOPTS_VALUE, AV_NOPTS_VALUE, 0);
    if (ret < 0)
    {
        fprintf(stderr, "Error while parsing\n");
        exit(1);
    }

    if (m_origin.pkt->size)
    {
        ret = avcodec_send_packet(m_origin.c, m_origin.pkt);
        if (ret < 0)
        {
            fprintf(stderr, "Error sending a packet for decoding\n");
            exit(1);
        }

        while (ret >= 0)
        {
            ret = avcodec_receive_frame(m_origin.c, m_origin.frame);
            if (ret == AVERROR(EAGAIN) || ret == AVERROR_EOF)
                return;
            else if (ret < 0)
            {
                fprintf(stderr, "Error during decoding\n");
                exit(1);
            }

            ret = avcodec_send_frame(m_transcode.c, m_transcode.frame);
            if (ret < 0)
            {
                fprintf(stderr, "Error sending a frame for encoding\n");
                exit(1);
            }

            while (ret >= 0)
            {
                ret = avcodec_receive_packet(m_transcode.c, m_transcode.pkt);
                if (ret == AVERROR(EAGAIN) || ret == AVERROR_EOF)
                    return;
                else if (ret < 0)
                {
                    fprintf(stderr, "Error during encoding\n");
                    exit(1);
                }

                if (m_cb != nullptr)
                {
                    m_cb(m_transcode.pkt->data, m_transcode.pkt->size);
                }
                av_packet_unref(m_transcode.pkt);
            }
        }
    }
}
