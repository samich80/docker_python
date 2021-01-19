# Version: 0.0.1
FROM ubuntu:18.04
MAINTAINER Samich80 <samich80@mail.ru>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y language-pack-ru
RUN apt purge -y python2.7
#RUN rm /usr/bin/python
RUN apt-get install -y python3
RUN apt install -y python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install --upgrade pip

ENV LANGUAGE ru_RU.UTF-8
ENV LANG ru_RU.UTF-8
ENV LC_ALL ru_RU.UTF-8
RUN locale-gen ru_RU.UTF-8 && dpkg-reconfigure locales

WORKDIR /
RUN mkdir work
RUN mkdir program
RUN mkdir /work/infiles
RUN mkdir /work/outfiles
RUN mkdir /work/config

VOLUME ["/work"] 

COPY program/Changer.py /program/

#ENTRYPOINT ["python /program/Changer.py"]
#CMD ["python", "/program/Changer.py"]
