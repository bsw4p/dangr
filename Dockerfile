FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
        python-dev libffi-dev build-essential wget 

RUN wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py && python /tmp/get-pip.py

RUN pip install virtualenv virtualenvwrapper

ENV WORKON_HOME=/angr
RUN mkdir -p $WORKON_HOME

ADD bashrc /.bashrc

RUN bash -c "source /usr/local/bin/virtualenvwrapper.sh && mkvirtualenv angr && pip install angr"
RUN ln -s /angr/angr/lib/python2.7/site-packages/angr/angr/lib/python2.7/site-packages/capstone/libcapstone.so /angr/angr/lib/python2.7/site-packages/capstone/

RUN echo "workon angr" >> /.bashrc
