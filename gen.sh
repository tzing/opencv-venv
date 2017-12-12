#!/bin/sh
if [ ! -f "opencv/CMakeLists.txt" ]; then
    git submodule update --init --recursive
fi

if [ ! $VIRTUAL_ENV ]; then
	echo Not in virtual env
	exit 1
fi

export PYTHON_EXECUTABLE=$(which python3)
export SITE_PACKAGES=$(python -c "import site; print(site.getsitepackages()[0])")

cmake \
	-DCMAKE_BUILD_TYPE=Release \
	\
	-DBUILD_opencv_python2=OFF \
	-DBUILD_opencv_java=OFF \
	\
	-DCUDA_GENERATION=Auto \
	-DCUDA_NVCC_FLAGS="-ccbin gcc-6" \
	\
	-DPYTHON_DEFAULT_EXECUTABLE=$PYTHON_EXECUTABLE \
	-DCMAKE_INSTALL_PREFIX=$VIRTUAL_ENV \
	-DPYTHON3_PACKAGES_PATH=$SITE_PACKAGES \
	\
	-DBUILD_TESTS=OFF \
	-DBUILD_PERF_TESTS=OFF \
	-DBUILD_PROTOBUF=OFF \
	\
	-DOPENCV_EXTRA_MODULES_PATH=./opencv_contrib/modules \
	./opencv
