FROM postgres:11.1

RUN apt-get update
RUN apt-get install -y build-essential postgresql-server-dev-11 wget

RUN apt-get install -y git

RUN wget -q -O - http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2 | tar xvjf -
RUN cd scws-1.2.3 ; ./configure ; make install

RUN git clone https://github.com/amutu/zhparser.git
RUN cd zhparser ; SCWS_HOME=/usr/local make && make install

COPY ./config /docker-entrypoint-initdb.d/config.sh
