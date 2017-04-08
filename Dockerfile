FROM python:2.7
ENV PYTHONUNBUFFERED 1

MAINTAINER WangJie <717728534@qq.com>

ADD ./requirements.txt /tmp/requirements.txt
ADD ./entrypoint.sh /entrypoint.sh

RUN pip install -r /tmp/requirements.txt  \
    && pip install uwsgi \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8000

WORKDIR /online

CMD ["/bin/sh","run.sh"]