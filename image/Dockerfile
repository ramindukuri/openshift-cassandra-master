# Copyright 2016 The Kubernetes Authors All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift:latest

USER root

RUN groupadd  cassandra 
RUN useradd  cassandra -g cassandra
RUN echo "cassandra ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && chmod -w /etc/sudoers
COPY run.sh /run.sh 
RUN chmod a+rx /run.sh  && chown cassandra /run.sh && chown cassandra /opt

ENV CASSANDRA_VERSION="3.11.2" \
    CASSANDRA_HOME="/opt/apache-cassandra" \
    HOME="/home/cassandra" \
    PATH="/opt/apache-cassandra/bin:$PATH"

RUN cd /opt &&\
    curl -LO curl -LO http://archive.apache.org/dist/cassandra/$CASSANDRA_VERSION/apache-cassandra-3.11.2-bin.tar.gz && ls -l &&\
    tar xvzf apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz && \
    rm apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz && \
    ln -s apache-cassandra-$CASSANDRA_VERSION apache-cassandra

RUN mkdir -p /etc/cassandra && mkdir -p /cassandra_data && \
  chown -R cassandra.cassandra /etc/cassandra /cassandra_data && \
  chmod o+w -R /etc/cassandra /cassandra_data && \
  mkdir -p /var/lib/cassandra && chmod o+rwx /var/lib/cassandra && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /usr/share/doc/ && \
  rm -rf /usr/share/doc-base/ && \
  rm -rf /usr/share/man/ && \
  rm -rf /tmp/* 

USER cassandra
COPY cassandra.yaml /etc/cassandra/cassandra.yaml
COPY logback.xml /etc/cassandra/logback.xml
COPY kubernetes-cassandra.jar /kubernetes-cassandra.jar

CMD [ "/run.sh", "|", "tee", "-a", "/cassandra_data/run.log" ]
