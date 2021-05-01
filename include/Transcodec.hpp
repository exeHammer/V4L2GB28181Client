/*
 * @Author: your name
 * @Date: 2021-05-01 21:43:06
 * @LastEditTime: 2021-05-01 21:54:45
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /V4L2GB28181Client/include/Transcodec.hpp
 */

#pragma once

#include <functional>
extern "C"
{
#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
}

struct CodecInfo
{
    AVCodec *codec = nullptr;
    AVCodecParserContext *parser = nullptr;
    AVCodecContext *c = nullptr;
    AVFrame *frame = nullptr;
    AVPacket *pkt = nullptr;
};

class Transcodec
{
public:
    Transcodec(AVCodecID origin, AVCodecID transcode);
    ~Transcodec();
    void inputFrame(const uint8_t *buf, int len);
    void setOutputCallback(std::function<void(const uint8_t *, int)> &cb) { m_cb = cb; }

private:
    void initCodec(CodecInfo &info);
    void freeCodec(CodecInfo &info);

private:
    CodecInfo m_origin;
    CodecInfo m_transcode;
    std::function<void(const uint8_t *, int)> m_cb;
};