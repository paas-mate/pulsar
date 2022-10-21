FROM ttbb/base:jdk11

WORKDIR /opt

ARG version=2.10.2
ARG download=2.10.2-bin

RUN wget -q https://archive.apache.org/dist/pulsar/pulsar-$version/apache-pulsar-$download.tar.gz  && \
mkdir -p /opt/pulsar && \
tar -xf apache-pulsar-$download.tar.gz -C /opt/pulsar --strip-components 1 && \
rm -rf apache-pulsar-$download.tar.gz

ENV PULSAR_HOME /opt/pulsar

WORKDIR /opt/pulsar
