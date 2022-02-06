FROM lolubyte/todo-base:latest
# Basic Meta data about the Image maintainers
LABEL  maintainer="Daniel Aboyewa  lolubyte.it@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Development-Image for lbitc todo application"

# Install dev/build dependencies
RUN  apt-get install -qy python3-dev 

# Activate  virtual environment and install wheel support
RUN  . /appenv/bin/activate && \
          pip install wheel --upgrade
 
#PIP environment variables (Note, this mudt be set after installing wheel)
ENV WHEELHOUSE=/wheelhouse  PIP_WHEEL_DIR=/wheelhouse \ PIP_FIND_LINKS=/wheelhouse XDG_CACHE_HOME=/cache

# Output: Build artifact(Wheel) are  output here

VOLUME   /wheelhouse

# Output: Build Cache
#VOLUME /build

#Output: test reports are output here

VOLUME   /reports

#  Adding test  entrypoint script
COPY  docker/dev/scripts/test.sh /usr/local/bin/test.sh
RUN chmod +x  /usr/local/bin/test.sh
#set default for entrypoint and command string
ENTRYPOINT ["test.sh"]
CMD ["python", "manage.py", "test", "--noinput"]

#add application Source
COPY  src /application
WORKDIR /application
