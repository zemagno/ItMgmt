OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :google_oauth2, '642665161474-77n1nro9svgti6riderdgonc73jslr89.apps.googleusercontent.com','dmVX01n4ob6_Up7NMeUDy0s_'
end
# provider :office365, '5604c84f-9864-4f4c-aa36-6751f5f9daa9','uuVikY5yuXayhnyQHPOYmrDeEBVBZ8JxhfoQFshpHqc='
