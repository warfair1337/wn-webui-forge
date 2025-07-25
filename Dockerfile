FROM nvidia/cuda:12.8.1-cudnn-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

EXPOSE 7860

WORKDIR /app

RUN apt-get update
RUN apt-get install nano -y
RUN apt-get install wget -y
RUN apt-get install mc -y
RUN apt-get install bc -y
RUN apt-get install libtcmalloc-minimal4 -y
RUN apt-get install ffmpeg -y
RUN apt-get install python3.10 -y
RUN apt-get install python-is-python3 -y
RUN apt-get install python3.10-venv -y
RUN apt-get install pip -y
RUN apt-get install git -y
RUN apt-get install pip -y

RUN useradd -m -u 99 -g 100 forge
RUN chown 99:100 /app

USER forge

RUN git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git
RUN chmod +x /app/stable-diffusion-webui-forge/webui-user.sh
RUN chmod +x /app/stable-diffusion-webui-forge/webui.sh

# ADD run.sh /app/stable-diffusion-webui-forge/
# RUN chmod +x /app/stable-diffusion-webui-forge/run.sh
# ENTRYPOINT ["/app/stable-diffusion-webui-forge/run.sh"]

CMD ["/app/stable-diffusion-webui-forge/webui.sh"]
