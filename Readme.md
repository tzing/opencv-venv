# OpenCV Venv

Scripts to build opencv from source in python virtual env

## build

```
git clone git@github.com:tzing/opencv-venv.git --recursive
cd opencv-venv
source <path-to-venv>/bin/activate
sh gen.sh
make -j8
make install
```

## clean

```
git clean -dxf
```

## environment

this script is used under *python3* + *opencv3*

+ python2 is DISABLED in [gen.sh](./gen.sh)
+ opencv2 is not tested
