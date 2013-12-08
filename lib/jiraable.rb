module Jiraable
	def jira_to_url
		@URLs = []
	    if jira != nil then 
	      jira.split(',').each do |c|
	      	if c.include? "INFRA-"
                   @URLs << [c,"http://jiracorp.brq.com/browse/#{c}"]
            else
                   @URLs << [c,"http://jira.brq.com/browse/#{c}"]
            end
	    end
	    end
	    @URLs
	 end
end