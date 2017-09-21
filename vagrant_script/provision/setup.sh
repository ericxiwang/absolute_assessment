#!/bin/bash

echo "install flask lib"

apt-get -y update
apt-get -y install python-pip python-dev build-essentia
pip install --upgrade pip
pip install virtualenv
pip install Flask
