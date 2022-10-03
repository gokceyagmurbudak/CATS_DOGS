FROM nvidia/cuda:11.7.1-base-ubuntu20.04

# Set bash as default shell
ENV SHELL=/bin/bash

# Create a working directory
WORKDIR /app/

# Build with some basic utilities
RUN apt-get update && apt-get install -y \
    python3-pip \
    apt-utils \
    vim \
    git 

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Istanbul
RUN apt-get install -y libfreetype6-dev libxft-dev

# alias python='python3'
RUN ln -s /usr/bin/python3 /usr/bin/python

COPY . .

RUN pip install -r requirements.txt

#RUN pip install \
#    numpy \
#    torch \
#    jupyterlab

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
EXPOSE 8888
