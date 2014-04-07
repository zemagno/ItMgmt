require 'rubygems'
require 'pp'
require 'jira'

# Consider the use of :use_ssl and :ssl_verify_mode options if running locally 
# for tests.

username = "myremoteuser"
password = "myuserspassword"

options = {
            :username => 'magno',
            :password => 'Esqesf!!1',
            :site     => 'http://jiracorp.brq.com/',
            :context_path => '/INFRA',
            :auth_type => :basic
          }

client = JIRA::Client.new(options)

# Show all projects
projects = client.Project.all

projects.each do |project|
  puts "Project -> key: #{project.key}, name: #{project.name}"
end