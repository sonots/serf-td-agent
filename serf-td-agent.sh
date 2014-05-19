#!/bin/bash

PROGRAM_NAME=$(basename $0)
INIT_SCRIPT="/etc/init.d/td-agent"
event=$SERF_EVENT
user_event=$SERF_USER_EVENT

usage() {
    echo "Usage: SERF_EVENT=user SERF_USER_EVENT={start|stop|reload|restart|condrestart|status|configtest} $PROGRAM_NAME"
}

if [ "$event" = "user" ]; then
  case "$user_event" in
    start|stop|reload|restart|condrestart|status|configtest)
      sudo $INIT_SCRIPT $user_event
      ;;
    *)
      usage && exit 1
      ;;
  esac
else
  usage && exit 1
fi
exit $?
