FROM ubuntu:latest

# update & install the minimum required libraries
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3-dev \
    python3-pip \
    python3-venv \
    sudo \
    vim \
    wget

# move project directory
RUN mkdir /amenom
WORKDIR /amenom

# set venv
RUN python3 -m venv venv && \
    . venv/bin/activate

RUN echo "alias python='/amenom/venv/bin/python3'" >> ~/.bashrc
ENV PATH /amenom/venv/bin:$PATH

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && \
    pip install -r requirements.txt
