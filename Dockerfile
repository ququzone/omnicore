FROM ubuntu:xenial

RUN apt-get update

RUN apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils -y
RUN apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y
RUN apt-get install libboost-all-dev -y

RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install libdb4.8-dev libdb4.8++-dev -y

WORKDIR /bin/app

ADD src/omnicored /bin/app/omnicored

EXPOSE 8332

CMD ["/bin/app/omnicored", "-conf=/bin/app/bitcoin.conf"]


