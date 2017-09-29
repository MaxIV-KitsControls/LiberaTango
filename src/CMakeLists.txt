cmake_minimum_required (VERSION 2.6)

project(LiberaTango)

#Target Settings
set (target_lib_name liberacommon)
set (libera_lib_folder /opt/libera/lib)

#Compiler related flags
set(CMAKE_CXX_FLAGS "-w -std=c++0x -D_GLIBCXX_USE_NANOSLEEP")

#Find libs
find_library(libmci liberamci3.2 HINTS ${libera_lib_folder})


############################################################
# Create the Shared Object
############################################################

# Create a sources variable with a link to all cpp files to compile
set(SOURCES
    LiberaClient.cpp
    LiberaAttr.cpp
    LiberaLogsAttr.cpp
    LiberaSignal.cpp
)

#Set Includes
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include
  /usr/include/libera-3.2
  /usr/include/tango
)

#Generate the shared library from the library sources
add_library(${target_lib_name} SHARED ${SOURCES})

#Link target
target_link_libraries(${target_lib_name} PUBLIC ${libmci})

############################################################
# Install
############################################################

install (TARGETS ${target_lib_name}
    DESTINATION ${libera_lib_folder})
