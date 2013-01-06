module Jiraable
	def jira_to_url
		@URLs = []
	    if jira != nil then 
	      jira.split(',').each do |c|
	        @URLs << [c,"http://jira.brq.com/browse/#{c}"]
	      end
	    end
	    @URLs
	 end
end