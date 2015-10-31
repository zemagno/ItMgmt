namespace :dbmanut do
  desc "Limpar producao"
  task :limpar_producao => :environment  do
    Producao.where("created_at < ?" , 7.days.ago).delete_all
    Event.where("created_at < ?" , 30.days.ago).delete_all
    JobEnviarEmail.where("created_at < ?" , 540.days.ago).delete_all
  end

end