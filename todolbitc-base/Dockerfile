FROM ubuntu:latest

# Basic Meta data about the Image maintaine
LABEL  maintainer="Daniel Aboyewa  lolubyte.it@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Base-Image for lbitc todo application"

#prevent dpkg error
ENV TERM=xterm-256color

#Set  mirrors to the closet  mirror to me
RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g"  /etc/apt/sources.list
# Install Python runtime
RUN  apt-get update -y && \
           apt-get install -y  \
           -o APT::Install-Recommended=false -o APT::Install-Suggests=false \
           python3-pip python3-venv default-libmysqlclient-dev build-essential

#create virtual environment and also upgrade PIP in the virtual environment to the latest version
RUN python3 -m venv /appenv && \
          . /appenv/bin/activate && \
          pip install pip --upgrade

#  Adding entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x  /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"] 