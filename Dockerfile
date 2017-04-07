FROM python:2.7
ENV PYTHONUNBUFFERED 1

MAINTAINER WangJie <717728534@qq.com>

ADD ./requirements.txt /requirements.txt
ADD ./entrypoint.sh /entrypoint.sh
ADD . /online

RUN pip install -r requirements.txt

RUN pip install uwsgi

RUN groupadd -r django && useradd -r -g django django

WORKDIR /online

ENTRYPOINT ["/entrypoint.sh"]