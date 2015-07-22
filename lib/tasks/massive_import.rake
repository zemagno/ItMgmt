# lib/tasks/massive_import.rake
 
namespace :massive_import do
  task :cis, [:configfile] => :environment do |t,args|
   
    MassiveImport.go(args)
  end
end

# rake massive_import:cis[/Users/zemagno/Dropbox/dev/ror/ItMgmt/externos_bsb.config]

