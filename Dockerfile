FROM shoothzj/compile:jdk21-mvn AS compiler

RUN git clone --depth 1 https://github.com/apache/pulsar.git && \
    cd pulsar && \
    mvn -B clean package -Pcore-modules,-main -DskipTests=true && \
    mkdir /opt/pulsar && \
    tar -xf /pulsar/distribution/server/target/apache-pulsar-3.3.0-SNAPSHOT-bin.tar.gz -C /opt/pulsar --strip-components 1

FROM shoothzj/base:jdk21

COPY --from=compiler /opt/pulsar /opt/pulsar

ENV PULSAR_HOME /opt/pulsar

WORKDIR /opt/pulsar

ENTRYPOINT [ "/opt/pulsar/entrypoint.sh" ]
