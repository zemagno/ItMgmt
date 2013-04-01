
require 'POpen4'
cmd_ = '~/Downloads/jira-cli-3.0.0/jira.sh --action createIssue --project INFR --summary "ticket aberto automaticamente pelo script do magno" --assignee petterson --user magno --password xxx --server=http://www.brq.com --type "Tarefa" --custom "customfield_10080:Vargas" --components "LAN"'

status = POpen4::popen4( cmd_ ) do |stdout, stderr, stdin|
    stdout.each do |line|
      puts line
      end
 end
puts status.exitstatus