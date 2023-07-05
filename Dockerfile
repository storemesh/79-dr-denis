FROM nvidia/cuda:11.3.1-devel-ubuntu20.04
ENV TZ=Asia/Bangkok \
    DEBIAN_FRONTEND=noninteractive
RUN apt-get update --fix-missing && apt-get install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa &&\
    add-apt-repository main && add-apt-repository universe && add-apt-repository restricted && add-apt-repository multiverse
RUN apt-get update --fix-missing && \
    apt-get install -y wget git unzip build-essential cmake git python3.8 python3-pip pkg-config libgtk-3-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
    gfortran openexr libatlas-base-dev python3-dev python3-numpy libtbb2 libtbb-dev libdc1394-22-dev libopenexr-dev \
    libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev && apt-get clean && rm -rf /var/cache/apt

RUN wget https://github.com/opencv/opencv/archive/4.8.0.zip
RUN unzip 4.8.0.zip && rm -rf 4.8.0.zip && mv opencv-4.8.0 OpenCV && cd OpenCV && mkdir build && cd build && \
    cmake -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DENABLE_PRECOMPILED_HEADERS=OFF .. && \
    make -j16 && make install && ldconfig

RUN pip3 install --upgrade setuptools pip 
RUN pip3 install detectron2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu113/torch1.10/index.html
COPY ./code/requirements.txt /code/requirements.txt
RUN pip3 install -r /code/requirements.txt
ADD run_jupyter.sh /code/run_jupyter.sh
WORKDIR /code/
