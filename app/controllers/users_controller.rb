class UsersController < InheritedResources::Base
	# layout 'application_novolayout' 
	load_and_authorize_resource

def show_perfil
	@user = current_user
end

end

