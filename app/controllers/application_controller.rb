
class ApplicationController < ActionController::Base
  protect_from_forgery

  # rescue_from Exception, :with => :error_render_method

  # def error_render_method(error)
  #   logger.warn(error.message)
  #   respond_to do |type|
  #     type.html { render :template => "errors/error_404", :status => 404 }
  #     type.all  { render :nothing => true, :status => 404 }
  #   end
  #   true
  # end

  def append_info_to_payload(payload)
    super
    payload[:remote_ip] = request.remote_ip
    payload[:user_id] = if current_user
      "#{current_user.name}[#{current_user.roles}]"
    else
      :guest
    end
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

  def finalAuth
    finalauth = {}
    finalauth[:view] = []
    finalauth[:edit] = []

    if session[:user_id]

      finalauth = Rails.cache.read("ability/#{current_user.name}") if current_user
      Rails.logger.debug "ApplicationController:finalAuth: current_user : #{current_user.name}"
      Rails.logger.debug "ApplicationController:finalAuth: finalauth: #{finalauth}"
      if finalauth.nil?
        finalauth = {}
        auth = Tipoci.all.map { |t| [t.id,t.perfil] }
        puts "auth : #{auth}"
        # perfil --> "compras admin[edit]"
        # perfil --> "compras admin[edit] admin[view]" b = admin[edit] .. b = compras
        # perfil --> "licenciamento"
        # current_roles = "suporte admin"
        finalauthView = auth.reject { |a| (! a[1].blank?) && ! a[1].split(' ').map(&:strip).any? { |b| current_user.roles.include?(b.gsub("[view]","")) } }.map { |x| x[0]}.sort
        finalauthEdit = auth.reject { |a| (! a[1].blank?) && ! a[1].split(' ').map(&:strip).any? { |b| current_user.roles.include?(b.gsub("[edit]","")) } }.map { |x| x[0]}.sort
        finalauth[:view] = finalauthView
        finalauth[:edit] = finalauthEdit
        Rails.cache.write("ability/#{current_user.name}",finalauth)
        # puts "************************************************************************"
        # puts "ability/#{current_user.name} --> #{finalauth}"
      end
    end
    Rails.logger.debug "ApplicationController:finalAuth: return: auth  #{auth}"
    Rails.logger.debug "ApplicationController:finalAuth: return: final #{finalauth}"

    finalauth
  end


  helper_method :finalAuth
  helper_method :current_user



  def remote_ip
    request.remote_ip
  end



end
