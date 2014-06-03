class ErrorsController < ApplicationController
  def not_found
    render :status => 404, :formats => [:html]
  end

  def server_error
    render :status => 500, :formats => [:html]
  end
end


# http://makandracards.com/makandra/12807-custom-error-pages-in-rails-3-2