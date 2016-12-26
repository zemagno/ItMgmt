class UsersController < InheritedResources::Base
	# layout 'application_novolayout' 
	load_and_authorize_resource
	skip_authorize_resource :only => :show_perfil
	before_filter :authenticate_user!
	
def show_perfil
	@user = current_user
end

end

