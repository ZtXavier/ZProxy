# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zt/program/ZProxy/ZProxy

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zt/program/ZProxy/ZProxy/build

# Include any dependencies generated for this target.
include client/CMakeFiles/client.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include client/CMakeFiles/client.dir/compiler_depend.make

# Include the progress variables for this target.
include client/CMakeFiles/client.dir/progress.make

# Include the compile flags for this target's objects.
include client/CMakeFiles/client.dir/flags.make

client/CMakeFiles/client.dir/Client.cpp.o: client/CMakeFiles/client.dir/flags.make
client/CMakeFiles/client.dir/Client.cpp.o: /home/zt/program/ZProxy/ZProxy/client/Client.cpp
client/CMakeFiles/client.dir/Client.cpp.o: client/CMakeFiles/client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zt/program/ZProxy/ZProxy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object client/CMakeFiles/client.dir/Client.cpp.o"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT client/CMakeFiles/client.dir/Client.cpp.o -MF CMakeFiles/client.dir/Client.cpp.o.d -o CMakeFiles/client.dir/Client.cpp.o -c /home/zt/program/ZProxy/ZProxy/client/Client.cpp

client/CMakeFiles/client.dir/Client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/Client.cpp.i"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zt/program/ZProxy/ZProxy/client/Client.cpp > CMakeFiles/client.dir/Client.cpp.i

client/CMakeFiles/client.dir/Client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/Client.cpp.s"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zt/program/ZProxy/ZProxy/client/Client.cpp -o CMakeFiles/client.dir/Client.cpp.s

client/CMakeFiles/client.dir/Main.cpp.o: client/CMakeFiles/client.dir/flags.make
client/CMakeFiles/client.dir/Main.cpp.o: /home/zt/program/ZProxy/ZProxy/client/Main.cpp
client/CMakeFiles/client.dir/Main.cpp.o: client/CMakeFiles/client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zt/program/ZProxy/ZProxy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object client/CMakeFiles/client.dir/Main.cpp.o"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT client/CMakeFiles/client.dir/Main.cpp.o -MF CMakeFiles/client.dir/Main.cpp.o.d -o CMakeFiles/client.dir/Main.cpp.o -c /home/zt/program/ZProxy/ZProxy/client/Main.cpp

client/CMakeFiles/client.dir/Main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/Main.cpp.i"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zt/program/ZProxy/ZProxy/client/Main.cpp > CMakeFiles/client.dir/Main.cpp.i

client/CMakeFiles/client.dir/Main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/Main.cpp.s"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zt/program/ZProxy/ZProxy/client/Main.cpp -o CMakeFiles/client.dir/Main.cpp.s

client/CMakeFiles/client.dir/Tunnel.cpp.o: client/CMakeFiles/client.dir/flags.make
client/CMakeFiles/client.dir/Tunnel.cpp.o: /home/zt/program/ZProxy/ZProxy/client/Tunnel.cpp
client/CMakeFiles/client.dir/Tunnel.cpp.o: client/CMakeFiles/client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zt/program/ZProxy/ZProxy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object client/CMakeFiles/client.dir/Tunnel.cpp.o"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT client/CMakeFiles/client.dir/Tunnel.cpp.o -MF CMakeFiles/client.dir/Tunnel.cpp.o.d -o CMakeFiles/client.dir/Tunnel.cpp.o -c /home/zt/program/ZProxy/ZProxy/client/Tunnel.cpp

client/CMakeFiles/client.dir/Tunnel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/Tunnel.cpp.i"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zt/program/ZProxy/ZProxy/client/Tunnel.cpp > CMakeFiles/client.dir/Tunnel.cpp.i

client/CMakeFiles/client.dir/Tunnel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/Tunnel.cpp.s"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zt/program/ZProxy/ZProxy/client/Tunnel.cpp -o CMakeFiles/client.dir/Tunnel.cpp.s

client/CMakeFiles/client.dir/local_conn.cpp.o: client/CMakeFiles/client.dir/flags.make
client/CMakeFiles/client.dir/local_conn.cpp.o: /home/zt/program/ZProxy/ZProxy/client/local_conn.cpp
client/CMakeFiles/client.dir/local_conn.cpp.o: client/CMakeFiles/client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zt/program/ZProxy/ZProxy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object client/CMakeFiles/client.dir/local_conn.cpp.o"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT client/CMakeFiles/client.dir/local_conn.cpp.o -MF CMakeFiles/client.dir/local_conn.cpp.o.d -o CMakeFiles/client.dir/local_conn.cpp.o -c /home/zt/program/ZProxy/ZProxy/client/local_conn.cpp

client/CMakeFiles/client.dir/local_conn.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/local_conn.cpp.i"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zt/program/ZProxy/ZProxy/client/local_conn.cpp > CMakeFiles/client.dir/local_conn.cpp.i

client/CMakeFiles/client.dir/local_conn.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/local_conn.cpp.s"
	cd /home/zt/program/ZProxy/ZProxy/build/client && clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zt/program/ZProxy/ZProxy/client/local_conn.cpp -o CMakeFiles/client.dir/local_conn.cpp.s

# Object files for target client
client_OBJECTS = \
"CMakeFiles/client.dir/Client.cpp.o" \
"CMakeFiles/client.dir/Main.cpp.o" \
"CMakeFiles/client.dir/Tunnel.cpp.o" \
"CMakeFiles/client.dir/local_conn.cpp.o"

# External object files for target client
client_EXTERNAL_OBJECTS =

client/client: client/CMakeFiles/client.dir/Client.cpp.o
client/client: client/CMakeFiles/client.dir/Main.cpp.o
client/client: client/CMakeFiles/client.dir/Tunnel.cpp.o
client/client: client/CMakeFiles/client.dir/local_conn.cpp.o
client/client: client/CMakeFiles/client.dir/build.make
client/client: base/libbase.a
client/client: client/CMakeFiles/client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zt/program/ZProxy/ZProxy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable client"
	cd /home/zt/program/ZProxy/ZProxy/build/client && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
client/CMakeFiles/client.dir/build: client/client
.PHONY : client/CMakeFiles/client.dir/build

client/CMakeFiles/client.dir/clean:
	cd /home/zt/program/ZProxy/ZProxy/build/client && $(CMAKE_COMMAND) -P CMakeFiles/client.dir/cmake_clean.cmake
.PHONY : client/CMakeFiles/client.dir/clean

client/CMakeFiles/client.dir/depend:
	cd /home/zt/program/ZProxy/ZProxy/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zt/program/ZProxy/ZProxy /home/zt/program/ZProxy/ZProxy/client /home/zt/program/ZProxy/ZProxy/build /home/zt/program/ZProxy/ZProxy/build/client /home/zt/program/ZProxy/ZProxy/build/client/CMakeFiles/client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : client/CMakeFiles/client.dir/depend

