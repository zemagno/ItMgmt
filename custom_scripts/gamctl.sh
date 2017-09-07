#!/bin/bash

DESC=gam4m
HOME=/home/gam4m

case "$1" in
  start)
        echo -n "Starting $DESC: "
        cd $HOME/gam
        mkdir -p $HOME/gam/tmp/pids
        source $HOME/.rvm/scripts/rvm
        passenger start --daemonize
        # bundle exec sidekiq -q Gestao,1 -q Admin,1 -q Mailing,5 -q Producao,1 -c 5 &
        bundle exec sidekiq -C config/sidekiq.yml &
        #screen -dmS sk /bin/bash -l -c 'cd $HOME/gam && bundle exec sidekiq -q Gestao,1 -q Admin,1 -q Mailing,5 -q Producao,1 -c 5'
        bundle exec rake ts:start
        ;;
  stop)
        echo -n "Stopping $DESC: "
        cd $HOME/gam
        source $HOME/.rvm/scripts/rvm
        bundle exec rake ts:stop
        bundle exec sidekiqctl stop tmp/pids/sidekiq.pid 0
        passenger stop
        ;;

  restart|force-reload)
        ${0} stop
        ${0} start
        ;;

  status)
        ;;

  *)
        echo "Usage: /etc/init.d/$DESC {start|stop|restart|force-reload|status}" >&2
        exit 1
        ;;
esac

exit 0
