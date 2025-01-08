FROM nvidia/cuda:12.6.3-cudnn-runtime-ubuntu24.04

EXPOSE 7860

WORKDIR /webui-forge

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install nano -y
RUN apt-get install wget -y
RUN apt-get install mc -y
RUN apt-get install libtcmalloc-minimal4 -y
RUN apt-get install ffmpeg -y
RUN apt-get install python3.10 -y
RUN apt-get install python-is-python3 -y
RUN apt-get install pip -y
RUN apt-get install git -y
RUN apt-get install pip -y

RUN git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git
CMD ["/webui-forge/webui-user.sh", "--listen --port 7860"]
