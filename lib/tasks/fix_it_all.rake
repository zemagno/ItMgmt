namespace :fix_it_all do
  desc "Analisando e consertando ambiente"
  task :analisar => :environment  do
  end
  task :consertar => :environment  do
    puts "Limpando abilities...."
    Rails.cache.delete_matched("ability*")
  end
  
  task :panic => :environment  do
    puts "Panic Mode..."
    Rake::Task["fix_it_all:consertar"].invoke
    %{'redis-cli flushdb'}
    puts "Reindexando Sphinx. Sistema ficara instavel"
    Rake::Task["ts:stop"].invoke
    %{'rm -rf db/sphinx'}
    %{'rm -rf tmp'} # apos apagar tmp, tem que rodar o ts:configura para criar o diretorio tmp/binlog/.....
    %{'rm  config/development.sphinx.conf'}
    Rake::Task["assets:precompile"].invoke
    Rake::Task["ts:clear_rt"].invoke
    Rake::Task["ts:clear"].invoke
    Rake::Task["ts:configure"].invoke
    Rake::Task["ts:regenerate"].invoke
    # TODO - parar todas as instancias de sidekiq 
    
  end


end