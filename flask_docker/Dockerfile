FROM ubuntu:latest

MAINTAINER Eric Wang <gowest.wang@gmail.com>

# Nginx + UWSGI Plugin
RUN apt-get update && \
    apt-get -y install \
    curl \
    python-dev \
    libmysqlclient-dev \
    nginx \
    supervisor \
    python-pip \
    build-essential
RUN pip install --upgrade pip 
RUN pip install virtualenv
RUN pip install Flask
RUN pip install uwsgi

RUN rm /etc/nginx/sites-enabled/default
COPY flask.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/flask.conf /etc/nginx/sites-enabled/flask.conf
COPY uwsgi.ini /var/www/app/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf


# Setup Supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


COPY . /opt/absolute/

CMD ["/usr/bin/supervisord"]

