class TemplatesEmailsController < InheritedResources::Base

	load_and_authorize_resource

def new
	@templates_email = TemplatesEmail.new
	@templates_email.sync = 1
	
end

end
