FROM python:3.6
LABEL NAME=davyj0nes/pytest
LABEL Version=0.0.1
LABEL Author=DavyJ0nes

RUN mkdir -p /src/app
RUN pip install docker-py feedparser nosexcover prometheus_client pycobertura pylint pytest pytest-cov requests setuptools sphinx

WORKDIR /src/app
