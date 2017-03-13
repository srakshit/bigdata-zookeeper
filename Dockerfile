FROM srakshit/alpine-base

MAINTAINER Subham Rakshit

ENV ZOOKEEPER_HOME="/opt/zookeeper" \
    ZOOKEEPER_VERSION="3.4.9" \
    PATH=$PATH:$ZOOKEEPER/bin

ADD ./zookeeper-* /opt/

RUN chmod +x /opt/zookeeper-download.sh \
    && sleep 1 \
    && /opt/zookeeper-download.sh \
    && rm /opt/zookeeper-download.sh \
    && ln -s /opt/zookeeper-$ZOOKEEPER_VERSION $ZOOKEEPER_HOME \
    && addgroup zoo \
    && adduser -S -G zoo zoo \
    && chown zoo:zoo -R /opt/zookeeper* \
    && chmod 754 /opt/zookeeper*
