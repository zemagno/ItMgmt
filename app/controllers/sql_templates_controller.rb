class SqlTemplatesController < InheritedResources::Base
before_filter :which_mode
authorize_resource


def edit
    @edit_mode = true
	show!
end

private 
def which_mode
    @edit_mode = false # request.method #.include? ("")
end

end