class UsersController < InheritedResources::Base
	# layout 'application_novolayout' 
	load_and_authorize_resource
end

