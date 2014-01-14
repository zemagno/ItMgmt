class ApplicationController < ActionController::Base
  protect_from_forgery

  #rescue_from Exception, :with => :error_render_method

  def error_render_method
    respond_to do |type|
      type.html { render :template => "errors/error_404", :status => 404 }
      type.all  { render :nothing => true, :status => 404 }
    end
    true
  end
  
  def access_denied(exception)
    redirect_to admin_organizations_path, :alert => exception.message
  end


  rescue_from CanCan::AccessDenied do |exception|
    if session[:return_to]
      redirect_to session[:return_to], :alert => exception.message
    else
      redirect_to root_path, :alert => exception.message
    end   
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  



  
end