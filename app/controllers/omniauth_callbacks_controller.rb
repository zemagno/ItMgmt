class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    puts "lets trace"
    puts "oa: #{request.env["omniauth.auth"]}"
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      puts "persisti"
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      puts "nao persisti. Vou direcionar para new user"
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :google_oauth2, :all
end