FROM python:2.7
ENV PYTHONUNBUFFERED 1

MAINTAINER WangJie <717728534@qq.com>

ADD ./requirements.txt /requirements.txt
ADD ./entrypoint.sh /entrypoint.sh
ADD . /online

RUN pip install -r requirements.txt

RUN pip install uwsgi

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN groupadd -r django && useradd -r -g django django

RUN chown -R django /online && chmod +x entrypoint.sh && chown django entrypoint.sh

USER django

WORKDIR /online

ENTRYPOINT ["/entrypoint.sh"]