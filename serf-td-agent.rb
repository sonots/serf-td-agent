#!/usr/bin/env ruby

INIT_SCRIPT = "/etc/init.d/td-agent"
event = ENV['SERF_EVENT']
user_event = ENV['SERF_USER_EVENT']

def usage
  puts "Usage: SERF_EVENT=user SERF_USER_EVENT={start|stop|reload|restart|condrestart|status|configtest} #{$PROGRAM_NAME}"
end

status = 0
case event
when "user"
  case user_event
  when "start", "stop", "reload", "restart", "condrestart", "status", "configtest"
    status = system "sudo #{INIT_SCRIPT} #{user_event}"
  else
    usage and exit 1
  end
else
  usage and exit 1
end
exit $status
