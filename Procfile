sphinx: bundle exec rake ts:start NODETACH=true
sikdekiq: bundle exec sidekiq -q Gestao,1 -q Admin,1 -q Mailing,5 -q Producao,1 -c 5 
web: bundle exec rails s -b 0.0.0.0 -p 3000