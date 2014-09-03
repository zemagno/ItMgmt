module Jiraable
	def jira_to_url
		JiraHelper.to_url(jira)
	end

	def nested_hash_value(obj,key)
	  if obj.respond_to?(:key?) && obj.key?(key)
	    obj[key]
	  elsif obj.respond_to?(:each)
	    r = nil
	    obj.find{ |*a| r=nested_hash_value(a.last,key) }
	    r
	  end
	end

	def retrieve_issuefields_values(_hash,_key)
		r = []
		e = nested_hash_value(_hash,_key)["allowedValues"].each do |v|
			r << [v["id"],v["value"]]
		end
		r
	end
end