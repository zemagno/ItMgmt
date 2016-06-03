class LogCiController < ApplicationController

def index
	id = params[:id]
	@ci = Ci.find(id)
	@logs = @ci.log_ci
end
end
