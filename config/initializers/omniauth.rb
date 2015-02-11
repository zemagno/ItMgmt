OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :google_oauth2, '642665161474-77n1nro9svgti6riderdgonc73jslr89.apps.googleusercontent.com','dmVX01n4ob6_Up7NMeUDy0s_'
 
  # provider :google_apps,  domain: 'brq.com'  
end
