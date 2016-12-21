ItMgmt::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # ITAM::CONFIG
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Logstash.new
  config.lograge.custom_options = lambda do |event|
    # capture some specific timing values you are interested in
    {:user => event.payload[:user_id], :uri => event.payload[:uri], :remote_ip => event.payload[:remote_ip]}
  end
  # Settings specified here will take precedence over those in config/application.rb

  config.action_dispatch.cookies_serializer = :hybrid
  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false
  # Do not eager load code on boot.
  config.eager_load = false


  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.active_record.raise_in_transactional_callbacks = true


  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
  #config.action_controller.perform_caching = true
  #config.cache_store = :dalli_store

  # Don't care if the mailer can't send

  #config.action_mailer.raise_delivery_errors = true
  #config.action_mailer.delivery_method = :smtp
  #config.action_mailer.perform_deliveries = true

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  #config.log_level = :debug

  
  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.default_url_options = {host: "localhost:3000"}


  # Do not compress assets
  config.assets.compress = false
  # config.assets.compile = true

  # Expands the lines which load the assets
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # config.after_initialize do
  #   ActiveRecord::Base.logger = Rails.logger.clone
  #   ActiveRecord::Base.logger.level = Logger::INFO
  # end


end
