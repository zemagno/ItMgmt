OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, 'ZpZnowAOUD4oFFooBAhr0A', 'yYSPzbwUJUTmdEJIuNj0TL2oPOnyTiXo3PJD40XOL0'
 # provider :google_oauth2, '944946805284.apps','.googleusercontent.com'
 # provider :google_oauth2, '944946805284.apps.googleusercontent.com',
 #                          '{"web":{"auth_uri":"https://accounts.google.com/o/oauth2/auth","token_uri":"https://accounts.google.com/o/oauth2/token","client_email":"944946805284@developer.gserviceaccount.com","client_x509_cert_url":"https://www.googleapis.com/robot/v1/metadata/x509/944946805284@developer.gserviceaccount.com","client_id":"944946805284.apps.googleusercontent.com","auth_provider_x509_cert_url":"https://www.googleapis.com/oauth2/v1/certs"}}',
 # 						    {name: "google_login", approval_prompt: ''}
   provider :google_apps,  domain: 'brq.com'  
end
