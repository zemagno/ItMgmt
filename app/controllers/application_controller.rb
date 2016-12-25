class ApplicationController < ActionController::Base
  layout 'application'     
  protect_from_forgery with: :exception
  # before_filter :authenticate_user!

  # rescue_from Exception, :with => :error_render_method

  # def error_render_method(error)
  #   logger.warn(error.message)
  #   respond_to do |type|
  #     type.html { render :template => "errors/error_404", :status => 404 }
  #     type.all  { render :nothing => true, :status => 404 }
  #   end
  #   true
  # end

  # around_action :collect_metrics

  # def collect_metrics
  #   start = Time.now
  #   yield
  #   duration = Time.now - start
  #   Rails.logger.info "[APMI] - #{controller_name}##{action_name}: #{duration}s"
  # end

  def append_info_to_payload(payload)
    super
    payload[:remote_ip] = request.remote_ip
    payload[:uri] = request.url.gsub(/[^\s]+\?/,"")
    payload[:user_id] = if current_user
      "#{current_user.email}[#{current_user.roles}]"
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

  # def current_user
  # retirado por conta do devise...
  #   begin
  #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   rescue Exception => error
  #     Rails.logger.debug "[DEBUG] ApplicationControole::current_user: #{error}"
  #     @current_user = nil
  #   end
  # end

  def finalAuth
    finalauth = {}
    finalauth[:view] = []
    finalauth[:edit] = []

    if current_user.id

      Rails.logger.debug "[DEBUG]ApplicationController:finalAuth: lendo do cache 'ability/#{current_user.id}'"
      finalauth = Rails.cache.read("ability/#{current_user.id}") if current_user
      Rails.logger.debug "[DEBUG]ApplicationController:finalAuth: current_user : #{current_user.id}"
      Rails.logger.debug "[DEBUG]ApplicationController:finalAuth: finalauth: #{finalauth}"
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
        Rails.logger.debug "[DEBUG]ApplicationController:finalAuth: gravando no cache 'ability/#{current_user.id}' - finalAuth: #{finalauth}"
        Rails.cache.write("ability/#{current_user.id}",finalauth)
        # puts "************************************************************************"
        # puts "ability/#{current_user.id} --> #{finalauth}"
      end
    end
    Rails.logger.debug "[DEBUG]ApplicationController:finalAuth: return: auth  #{auth}"
    Rails.logger.debug "[DEBUG]ApplicationController:finalAuth: return: final #{finalauth}"

    finalauth
  end


  helper_method :finalAuth
  helper_method :current_user



  def remote_ip
    request.remote_ip
  end



end
