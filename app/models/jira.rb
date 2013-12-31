class Jira
  
  def self.to_url(jira)
    @URLs = []
	    if jira != nil then 
	        jira.split(',').each do |c|
	      	if c.include? "INFRA-"
                   @URLs << [c,"http://jiracorp.brq.com/browse/#{c}"]
            elsif c.include? "INFR-"
                   @URLs << [c,"http://jira.brq.com/browse/#{c}"]
            end
	    end
	    end
	@URLs
  end
  
  
end
