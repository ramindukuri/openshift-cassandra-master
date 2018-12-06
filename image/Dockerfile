FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift:latest

ENV CASSANDRA_VERSION="3.11.2" \
    CASSANDRA_HOME="/home/jboss/cassandra/apache-cassandra-3.11.2" \
    HOME="/home/jboss" \
    PATH="/home/jboss/cassandra/apache-cassandra/bin:$PATH"

RUN mkdir -p /home/jboss/cassandra /home/jboss/cassandra/apache-cassandra-3.11.2  /home/jboss/cassandra/apache-cassandra-3.11.2/logs && cd /home/jboss/cassandra

COPY apache-cassandra-3.11.2-bin.tar.gz /home/jboss/cassandra/apache-cassandra-3.11.2-bin.tar.gz

RUN cd /home/jboss/cassandra &&\
#    curl -LO http://archive.apache.org/dist/cassandra/3.11.2/apache-cassandra-3.11.2-bin.tar.gz && \
    tar xvzf apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz && \
    rm apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz && \
    ln -s apache-cassandra-$CASSANDRA_VERSION apache-cassandra

USER root

COPY run.sh /run.sh 
RUN chown jboss /run.sh
RUN chmod o+rwx /run.sh
RUN mkdir -p /cassandra_data/
RUN mkdir -p /cassandra_data/data
RUN mkdir -p /cassandra_data/commitlog
RUN mkdir -p /cassandra_data/saved_caches
RUN chown -R jboss /cassandra_data
RUN mkdir -p /etc/cassandra &&  chown -R jboss /etc/cassandra && chmod o+w -R /etc/cassandra 
RUN mkdir -p /var/lib/cassandra && chmod o+rwx /var/lib/cassandra && chown -R jboss /var/lib/cassandra
RUN chown -R jboss /home/jboss/cassandra/apache-cassandra-3.11.2

USER jboss

COPY cassandra.yaml /etc/cassandra/cassandra.yaml
COPY logback.xml /etc/cassandra/logback.xml
COPY kubernetes-cassandra.jar /kubernetes-cassandra.jar

CMD [ "/run.sh", "|", "tee", "-a", "/cassandra_data/run.log" ]
