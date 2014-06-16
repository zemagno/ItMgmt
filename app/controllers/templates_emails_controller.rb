class TemplatesEmailsController < InheritedResources::Base

def new
	@templates_email = TemplatesEmail.new
	@templates_email.sync = 1
	
end

end
