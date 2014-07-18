class MailingsController < InheritedResources::Base
	def templates 
    	TemplatesEmail.all
    end

    helper_method :templates
end
