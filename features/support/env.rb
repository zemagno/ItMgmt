# Before('@omniauth_test') do
# require_relative 'helpers/omniauth'
require 'omniauth'
  
puts "Alterando Omniauth para poder rodar testes.."
OmniAuth.config.test_mode = true
  # Capybara.default_host = 'http://127.0.0.1:3000'

OmniAuth.config.add_mock(:google_oauth2, {
    :uid => '114585181964171170598',
    :info => {
      :name => 'zemagno@gmail.com',
  }
})
