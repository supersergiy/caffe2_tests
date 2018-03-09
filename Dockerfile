FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04
#FROM ubuntu:16.04
 
RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion libbz2-dev libz-dev libpng-dev

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

ENV PATH /opt/conda/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/cuda-9.0/lib64:/usr/local/cuda-9.0/extras/CUPTI/lib64:$LD_LIBRARY_PATH

WORKDIR /caffe2
RUN cd /tmp && conda install -c caffe2 caffe2-cuda9.0-cudnn7
#RUN conda install -c conda-forge onnx;  \
#    conda install -c conda-forge onnx 

 

