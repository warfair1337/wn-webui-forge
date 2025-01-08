FROM nvidia/cuda:12.6.3-cudnn-runtime-ubuntu24.04

EXPOSE 7860

WORKDIR /webui-forge

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install nano -y
RUN apt install wget -y
RUN apt install mc -y
RUN apt install libgl1-mesa-glx -y
RUN apt install libtcmalloc-minimal4 -y
RUN apt install libcufft10 -y
RUN apt install cmake -y
RUN apt install build-essential -y
RUN apt install ffmpeg -y
RUN apt install python3.10 -y
RUN apt install python-is-python3 -y
RUN apt install pip -y
RUN apt install dotnet-sdk-8.0 -y
RUN apt install git -y
RUN apt install pip -y

RUN git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git
CMD ["/webui-forge/webui-user.sh", "--listen --port 7860"]
