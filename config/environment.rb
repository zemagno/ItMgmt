# Load the rails application
require File.expand_path('../application', __FILE__)

# Autenticacao no google via proxy
# OpenID::fetcher_use_env_http_proxy
# Initialize the rails application
ItMgmt::Application.initialize!


# Rails.logger = Le.new('51bae9a7-1146-42f4-bfec-6050101c93cf', debug: true)