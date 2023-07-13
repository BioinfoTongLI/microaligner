#FROM continuumio/miniconda3:4.10.3
FROM python:3.10-slim

RUN apt-get --allow-releaseinfo-change update && apt-get install --fix-missing  libgl1-mesa-glx procps git libglib2.0-0 -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN python3 -m pip install --upgrade pip \
	fire \
	--no-cache-dir
RUN git clone https://github.com/BioinfoTongLI/microaligner.git
RUN cd microaligner && git checkout develop && python3 -m pip install -e .
