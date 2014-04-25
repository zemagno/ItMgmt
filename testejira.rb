require 'rubygems'
require 'pp'
require 'jira'
require "awesome_print"

# Consider the use of :use_ssl and :ssl_verify_mode options if running locally 
# for tests.

username = "myremoteuser"
password = "myuserspassword"

# options = {
#             :username => 'magno',
#             :password => 'nc1702', 
#             :site     => 'http://192.168.0.106:8080',
#             :context_path => '',
#             :use_ssl=>false, 
#             :auth_type => :basic
#           }

options = {
            :username => 'magno',
            :password => 'Kjcmnvsf!!1', 
            :site     => 'http://jiracorp.brq.com',
            :context_path => '',
            :use_ssl=>false, 
            :auth_type => :basic
          }


client = JIRA::Client.new(options)

# Show all projects
projects = client.Project.find('INFRA')


projects.issues.each do |issue|
  puts "#{issue.id} - #{issue.summary}"
end


# https://github.com/sumoheavy/jira-ruby

# para visualizar --> ap projects.issues[0].attrs
# # Find a specific project by key
# # ------------------------------
# project = client.Project.find('SAMPLEPROJECT')
# pp project
# project.issues.each do |issue|
#   puts "#{issue.id} - #{issue.fields['summary']}"
# end
#
# # List all Issues
# # ---------------
# client.Issue.all.each do |issue|
#   puts "#{issue.id} - #{issue.fields['summary']}"
# end
#
# # List issues by JQL query
# # ------------------------
# client.Issue.jql('PROJECT = "SAMPLEPROJECT"').each do |issue|
#   puts "#{issue.id} - #{issue.fields['summary']}"
# end
#
# # Delete an issue
# # ---------------
# issue = client.Issue.find('SAMPLEPROJECT-2')
# if issue.delete
#   puts "Delete of issue SAMPLEPROJECT-2 sucessful"
# else
#   puts "Delete of issue SAMPLEPROJECT-2 failed"
# end
#
# # Create an issue
# # ---------------
# issue = client.Issue.build
# issue.save({"fields"=>{"summary"=>"blarg from in example.rb","project"=>{"id"=>"10001"},"issuetype"=>{"id"=>"3"}}})
# issue.fetch
# pp issue
#
# # Update an issue
# # ---------------
# issue = client.Issue.find("10002")
# issue.save({"fields"=>{"summary"=>"EVEN MOOOOOOARRR NINJAAAA!"}})
# pp issue
#
# # Find a user
# # -----------
# user = client.User.find('admin')
# pp user
#
# # Get all issue types
# # -------------------
# issuetypes = client.Issuetype.all
# pp issuetypes
#
# # Get a single issue type
# # -----------------------
# issuetype = client.Issuetype.find('5')
# pp issuetype
#
# #  Get all comments for an issue
# #  -----------------------------
# issue.comments.each do |comment|
#   pp comment
# end
#
# # Build and Save a comment
# # # ------------------------
# comment = issue.comments.build
# comment.save!(:body => "New comment from example script")
# comment.save!(:body => "#{comment.body}\nnovo comentario2")
#
# # Delete a comment from the collection
# # ------------------------------------
# issue.comments.last.delete
#
# # Update an existing comment
# # --------------------------
# issue.comments.first.save({"body" => "an updated comment frome example.rb"})