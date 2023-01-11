FROM shoothzj/base:jdk17

WORKDIR /opt

ARG version=2.11.0
ARG download=2.11.0-bin

RUN wget -q https://archive.apache.org/dist/pulsar/pulsar-$version/apache-pulsar-$download.tar.gz  && \
mkdir -p /opt/pulsar && \
tar -xf apache-pulsar-$download.tar.gz -C /opt/pulsar --strip-components 1 && \
rm -rf apache-pulsar-$download.tar.gz

ENV PULSAR_HOME /opt/pulsar

WORKDIR /opt/pulsar
