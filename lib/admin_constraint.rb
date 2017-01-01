class AdminConstraint
    def initialize(action, resource)
        @action = action
        @resource = resource
    end
 
    def matches?(request)
        if request.session['warden.user.user.key'].present?
            current_user = User.find(request.session["warden.user.user.key"][0][0])
            ability = Ability.new(current_user)
            return ability.can?(@action, @resource)
        else
            return false
        end
    end
end