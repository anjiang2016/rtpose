# Config file for the Caffe package.
#
# Note:
#   Caffe and this config file depends on opencv,
#   so put `find_package(OpenCV)` before searching Caffe
#   via `find_package(Caffe)`. All other lib/includes
#   dependencies are hard coded in the file
#
# After successful configuration the following variables
# will be defined:
#
#   Caffe_INCLUDE_DIRS - Caffe include directories
#   Caffe_LIBRARIES    - libraries to link against
#   Caffe_DEFINITIONS  - a list of definitions to pass to compiler
#
#   Caffe_HAVE_CUDA    - signals about CUDA support
#   Caffe_HAVE_CUDNN   - signals about cuDNN support


# OpenCV dependency (optional)

if(ON)
  if(NOT OpenCV_FOUND)
    set(Caffe_OpenCV_CONFIG_PATH "C:/Users/HX/.caffe/dependencies/libraries_v140_x64_py35_1.1.0/libraries")
    if(Caffe_OpenCV_CONFIG_PATH)
      get_filename_component(Caffe_OpenCV_CONFIG_PATH ${Caffe_OpenCV_CONFIG_PATH} ABSOLUTE)

      if(EXISTS ${Caffe_OpenCV_CONFIG_PATH} AND NOT TARGET opencv_core)
        message(STATUS "Caffe: using OpenCV config from ${Caffe_OpenCV_CONFIG_PATH}")
        include(${Caffe_OpenCV_CONFIG_PATH}/OpenCVModules.cmake)
      endif()

    else()
      find_package(OpenCV REQUIRED)
    endif()
    unset(Caffe_OpenCV_CONFIG_PATH)
  endif()
endif()

# Compute paths
get_filename_component(Caffe_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
set(Caffe_INCLUDE_DIRS "E:/code/person_pose_estimation/caffe_rtpose-master/caffe_rtpose-master/src;C:/Users/HX/.caffe/dependencies/libraries_v140_x64_py35_1.1.0/libraries/include/boost-1_61;C:/Users/HX/.caffe/dependencies/libraries_v140_x64_py35_1.1.0/libraries/include;E:/code/person_pose_estimation/caffe_rtpose-master/caffe_rtpose-master/build_1/include;C:/Users/HX/Anaconda3/Library/include;C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v8.0/include;C:/Users/HX/.caffe/dependencies/libraries_v140_x64_py35_1.1.0/libraries/include/opencv;C:/Users/HX/Anaconda3/include;C:/Users/HX/Anaconda3/Lib/site-packages/numpy/core/include;E:/code/person_pose_estimation/caffe_rtpose-master/caffe_rtpose-master/include")



# Our library dependencies
if(NOT TARGET caffe AND NOT caffe_BINARY_DIR)
  include("${Caffe_CMAKE_DIR}/CaffeTargets.cmake")
endif()

# List of IMPORTED libs created by CaffeTargets.cmake
set(Caffe_LIBRARIES caffe)

# Definitions
set(Caffe_DEFINITIONS "-DUSE_OPENCV;-DUSE_LMDB;-DUSE_LEVELDB")

# Cuda support variables
set(Caffe_CPU_ONLY OFF)
set(Caffe_HAVE_CUDA TRUE)
set(Caffe_HAVE_CUDNN TRUE)
