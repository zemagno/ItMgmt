source 'http://rubygems.org'

# gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"

gem 'railties'
gem 'rails', '4.2.7'
gem 'protected_attributes'
gem 'responders' #, '~> 2.0'

gem 'slim-rails'
gem 'slim'



group :test, :development do
  gem 'hirb'
end

gem "lograge" # formatador de log
gem 'logstash-event' # gerar formato do log compativel com logstash
# gem 'bunny' #, '~> 1.7.0' # client do rabbitmq

# gem 'tiny_tds', '0.7.0'
# gem 'activerecord-sqlserver-adapter'
gem 'will_paginate' #, '~> 3.0'


#gem 'jira-ruby'

gem 'oauth' #, '~> 0.4.7' # exigido pelo JIRA, que agora esta dentro do lib

gem 'mysql2' #, '0.3.20'


gem 'thin' # web server

# gem 'log4r'

# gem 'foreman'

gem 'nokogiri' , '1.6.6.2' # Nao mudar a versao dessa gem, pois da problema de compilacao (pelo menos no mac)

gem 'axlsx_rails' # gerador de Excel via nokogiri

# gem 'pusher' # gem de notificacao no browser - pago

# gem 'wisper' # publish/subscriber

gem 'inherited_resources'


gem 'thinking-sphinx' #, '2.0.13'

gem 'ruby-graphviz'

gem 'jquery-rails'

# gem "audited-activerecord" #, "~> 3.0"
gem "audited"

gem 'rake' #, '10.4.2'

gem "therubyracer" # para compilar javascript

#gem "less-rails"
#
gem 'redis-rails' #,  '~> 3.2'

gem 'sass-rails'
gem 'coffee-rails' #, '~> 4.2'

gem "nifty-generators", :group => :development

gem "awesome_print", require:"ap", :group => :development
# gem 'omniauth-google-apps'

gem 'omniauth-oauth2', '~> 1.3.1'
gem 'omniauth-google-oauth2', '0.2.6'
gem 'cancan' ,  '~> 1.6'
gem 'dalli', '2.7.4'   # cache no redis


gem 'whenever', :require => false # crontab like
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sinatra', require: false

# gem 'quiet_assets' # suppresses output of asset requests

gem 'deep_cloneable'

gem "rspec-rails", :group => [:development, :test]

group :test do
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'rspec'
  gem 'mocha'
  gem 'rspec-expectations'
  gem "selenium-webdriver"
end

group :test do
  gem "capybara"
  gem "connection_pool"
  gem "launchy"
  gem "minitest-reporters"
  gem "mocha"
  gem "poltergeist"
  gem "shoulda-context"
  gem "shoulda-matchers", ">= 3.0.1"
  gem "test_after_commit"
end
