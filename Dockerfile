FROM nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

EXPOSE 7860

WORKDIR /app

RUN apt-get update
RUN apt-get install nano -y
RUN apt-get install wget -y
RUN apt-get install mc -y
RUN apt-get install libtcmalloc-minimal4 -y
RUN apt-get install ffmpeg -y
RUN apt-get install python3.10 -y
RUN apt-get install python-is-python3 -y
RUN apt-get install python3.10-venv -y
RUN apt-get install pip -y
RUN apt-get install git -y
RUN apt-get install pip -y

RUN groupadd -g 1212 forge  && \
    useradd -m -u 1200 -g forge forge

RUN chown forge:forge /app

USER forge

RUN git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git
RUN chmod +x /app/stable-diffusion-webui-forge/webui-user.sh
RUN chmod +x /app/stable-diffusion-webui-forge/webui.sh
RUN chown -R forge:forge /app/stable-diffusion-webui-forge
CMD ["/app/stable-diffusion-webui-forge/webui.sh", "--listen"]
