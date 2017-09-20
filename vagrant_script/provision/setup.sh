#!/bin/bash

echo "install flask lib"

apg-get -y update
apg-get -y install python-pip python-dev build-essentia
pip install --upgrade pip
pip install virtualenv
pip install Flask
