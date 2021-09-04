FROM ttbb/base

LABEL maintainer="shoothzj@gmail.com"

WORKDIR /opt/sh

RUN mkdir -p /opt/sh/clickhouse/common-static && \
mkdir -p /opt/sh/clickhouse/client && \
mkdir -p /opt/sh/clickhouse/server && \
curl -OL https://github.com/ClickHouse/ClickHouse/releases/download/v21.8.5.7-lts/clickhouse-common-static-21.8.5.7.tgz && \
curl -OL https://github.com/ClickHouse/ClickHouse/releases/download/v21.8.5.7-lts/clickhouse-client-21.8.5.7.tgz && \
curl -OL https://github.com/ClickHouse/ClickHouse/releases/download/v21.8.5.7-lts/clickhouse-server-21.8.5.7.tgz && \
tar -xf clickhouse-common-static-21.8.5.7.tgz -C /opt/sh/clickhouse/common-static --strip-components 2 && \
/opt/sh/clickhouse/common-static/install/doinst.sh && \
tar -xf clickhouse-client-21.8.5.7.tgz -C /opt/sh/clickhouse/client --strip-components 2 && \
/opt/sh/clickhouse/client/install/doinst.sh && \
tar -xf clickhouse-server-21.8.5.7.tgz -C /opt/sh/clickhouse/server --strip-components 2 && \
/opt/sh/clickhouse/server/install/doinst.sh && \
rm -rf clickhouse-common-static-21.8.5.7.tgz && \
rm -rf clickhouse-client-21.8.5.7.tgz && \
rm -rf clickhouse-server-21.8.5.7.tgz && \
chown -R clickhouse:clickhouse /opt/sh/clickhouse && \
chown -R /etc/clickhouse-server && \
chown -R /etc/clickhouse-client && \
echo "alias ll='ls -al'" >> /etc/bashrc && \
echo "alias ..='cd ..'" >> /etc/bashrc && \
echo "alias ...='cd ../..'" >> /etc/bashrc && \
echo "alias tailf='tail -f'" >> /etc/bashrc

WORKDIR /opt/sh/clickhouse

USER clickhouse