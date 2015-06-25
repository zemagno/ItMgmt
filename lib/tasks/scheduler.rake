namespace :scheduler do
  desc "Scheduler..."
  task :go => :environment do
    Scheduler.go
    puts "Scheduler.go - #{Time.now} - Success!"
  end
end