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
  	exec 'redis-cli flushdb'
  end


end