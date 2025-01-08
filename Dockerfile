FROM nvidia/cuda:12.6.3-cudnn-runtime-ubuntu24.04

EXPOSE 7860

WORKDIR /webui-forge

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y -q=2 && \
    apt-get install -y -q=2 curl \
    wget \
    mc \
    bc \
    nano \
    rsync \
    libgl1-mesa-glx \
    libtcmalloc-minimal4 \
    libcufft10 \
    cmake \
    build-essential \
    ffmpeg \
    python3.12 \
    python-is-python3 \
    pip \
    libopencv-dev \
    dotnet-sdk-8.0 \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git
CMD ["/webui-forge/webui-user.sh", "--listen"]
