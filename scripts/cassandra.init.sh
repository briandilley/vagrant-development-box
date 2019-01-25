#! /bin/sh
### BEGIN INIT INFO
# Provides: cassandra
# Required-Start: $remote_fs $syslog
# Required-Stop: $remote_fs $syslog
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Cassandra
# Description: This file starts and stops Cassandra cluster
# 
### END INIT INFO

CASSANDRA_DIR=/opt/cassandra/3.0.9
CCM_CONF_DIR=/opt/cassandra/ccm

export TERM="dumb"
export JAVA_HOME=/opt/jdk1.8.0_202
export PATH=/opt/jdk1.8.0_202/bin:$PATH

case "$1" in
 start)
   if [ ! -d "$CCM_CONF_DIR" ]
   then
     echo "CREATING CLUSTER"
     mkdir -p $CASSANDRA_DIR
     mkdir -p $CCM_CONF_DIR
     ccm create --install-dir=$CCM_CONF_DIR --install-dir=$CASSANDRA_DIR -v 3.0.9 -n 3 -d -s -i 10.0.2.3 --vnodes --root vagrant
   else
     ccm start
   fi
   ;;

 stop)
   ccm stop
   sleep 10
   ;;

 restart)
   $0 stop
   $0 start
   ;;

 *)
   echo "Usage: cassandra {start|stop|restart}" >&2
   exit 3
   ;;
esac
