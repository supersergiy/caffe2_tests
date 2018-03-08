from continuumio/miniconda

WORKDIR /opt
RUN cd /tmp && conda install -c caffe2 caffe2-cuda9.0-cudnn7
RUN conda install -c conda-forge onnx;  \
    conda install -c conda-forge onnx 
 

