class MailerController < ApplicationController


  def preview_welcome
    @ci = Ci.find(361)
    render :file => 'ci_mailer/revalidar_servidor.html.erb', :layout => 'application'
  end

end