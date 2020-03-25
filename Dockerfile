FROM  nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

WORKDIR /srv/app

COPY setup.sh ./

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev nodejs npm openjdk-8-jdk \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && ln -s /usr/bin/pip3 pip \
  && pip3 install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*
RUN ./setup.sh

CMD [ "jupyter", "notebook", "--NotebookApp.allow_origin=*", "--ip=0.0.0.0", "--no-browser", "--port=8888", "--NotebookApp.port_retries=0", "--allow-root", "--NotebookApp.token=''" ]
