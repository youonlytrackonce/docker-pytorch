FROM nvcr.io/nvidia/pytorch:22.04-py3

# https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/rel_22-08.html#rel_22-08

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Istanbul

# Install base utilities
RUN apt-get -y update \
    apt-get -y install build-essential \
    git \
	wget \
	curl \
    gdb \
	nano \
	vim \
    clean \
    rm -rf /var/lib/apt/lists/*

# RUN git config --global http.sslVerify false

# RUN pip3 install cmake \
#	--trusted-host=pypi.python.org --trusted-host=pypi.org --trusted-host=files.pythonhosted.org

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH


# setup conda virtual environment
COPY ./requirements.yaml /tmp/requirements.yaml
RUN conda update conda \
    && conda env create --name camera-seg -f /tmp/requirements.yaml

RUN echo "conda activate camera-seg" >> ~/.bashrc
ENV PATH /opt/conda/envs/camera-seg/bin:$PATH
ENV CONDA_DEFAULT_ENV $camera-seg



