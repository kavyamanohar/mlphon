FROM python:3.7-buster
MAINTAINER Kavya Manohar "sakhi.kavya@gmail.coom"
WORKDIR /app
COPY . /app
RUN apt-get update -y
RUN apt-get install -y make sfst python3-pip
RUN make

RUN pip install -r web/requirements.txt

WORKDIR /app/web
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 mlphonweb:app