# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build

# Include any dependencies generated for this target.
include tests/CMakeFiles/test_shell.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/test_shell.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/test_shell.dir/flags.make

tests/CMakeFiles/test_shell.dir/test_shell.cpp.o: tests/CMakeFiles/test_shell.dir/flags.make
tests/CMakeFiles/test_shell.dir/test_shell.cpp.o: ../tests/test_shell.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/test_shell.dir/test_shell.cpp.o"
	cd /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_shell.dir/test_shell.cpp.o -c /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/tests/test_shell.cpp

tests/CMakeFiles/test_shell.dir/test_shell.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_shell.dir/test_shell.cpp.i"
	cd /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/tests/test_shell.cpp > CMakeFiles/test_shell.dir/test_shell.cpp.i

tests/CMakeFiles/test_shell.dir/test_shell.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_shell.dir/test_shell.cpp.s"
	cd /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/tests/test_shell.cpp -o CMakeFiles/test_shell.dir/test_shell.cpp.s

# Object files for target test_shell
test_shell_OBJECTS = \
"CMakeFiles/test_shell.dir/test_shell.cpp.o"

# External object files for target test_shell
test_shell_EXTERNAL_OBJECTS =

bin/test_shell: tests/CMakeFiles/test_shell.dir/test_shell.cpp.o
bin/test_shell: tests/CMakeFiles/test_shell.dir/build.make
bin/test_shell: lib/libZLToolKit.so
bin/test_shell: /usr/lib/x86_64-linux-gnu/libssl.so
bin/test_shell: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/test_shell: /usr/lib/x86_64-linux-gnu/libmysqlclient.so
bin/test_shell: tests/CMakeFiles/test_shell.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/test_shell"
	cd /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_shell.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/test_shell.dir/build: bin/test_shell

.PHONY : tests/CMakeFiles/test_shell.dir/build

tests/CMakeFiles/test_shell.dir/clean:
	cd /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build/tests && $(CMAKE_COMMAND) -P CMakeFiles/test_shell.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/test_shell.dir/clean

tests/CMakeFiles/test_shell.dir/depend:
	cd /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/tests /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build/tests /home/ares/V4L2GB28181Client/3rdpart/ZLToolKit/linux_build/tests/CMakeFiles/test_shell.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/test_shell.dir/depend

