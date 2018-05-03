#!/bin/bash

echo '127.0.1.1 cfg01' >> /etc/hosts
export HOSTNAME=cfg01
export DOMAIN="dev-test.local" # might need to be changed
export CLUSTER_NAME=demo

export FORMULAS_SOURCE="pkg"
export EXTRA_FORMULAS="linux salt reclass maas memcached openssh ntp  sphinx \
  grafana libvirt rsyslog glusterfs postfix xtrabackup freeipa prometheus telegraf \
  elasticsearch kibana rundeck devops-portal rsync docker keepalived aptly jenkins \
  gerrit artifactory influxdb horizon nginx collectd heka mysql backupninja galera nagios keepalived"
export MASTER_HOSTNAME=${HOSTNAME}.${DOMAIN}
export MINION_ID=$HOSTNAME
export RECLASS_IGNORE_CLASS_NOTFOUND=False
export RECLASS_ADDRESS="https://github.com/chnyda/demo-model.git"
export SALT_MASTER_IP=127.0.0.1

source /srv/salt/scripts/bootstrap.sh
source_local_envs
/srv/salt/scripts/bootstrap.sh
