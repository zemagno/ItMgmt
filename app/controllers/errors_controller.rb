class ErrorsController < ApplicationController
  def not_found
  	puts "Erros Not found"
    render :status => 404, :formats => [:html]
  end

  def server_error

  	puts "Erros Not found"
    render :status => 500, :formats => [:html]
  end

  def internal_server_error

  	puts "Erros Not found"
    render :status => 500, :formats => [:html]
  end
end

# https://mattbrictson.com/dynamic-rails-error-pages

# http://makandracards.com/makandra/12807-custom-error-pages-in-rails-3-2