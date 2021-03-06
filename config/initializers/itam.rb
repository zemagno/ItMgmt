# CONFIG = YAML.load_file("#{Rails.root.to_s}/config/itam.yml")[Rails.env]

Rails.logger.info "[INFO] Initializer:itam.rb ENV:#{Rails.env}"
Rails.logger.info "[INFO] Initializer:itam.rb client#{CONFIG["client"]}"
Rails.logger.info "[INFO] Initializer:itam.rb system_version:#{CONFIG["system_version"]}"
Rails.logger.info "[INFO] Initializer:itam.rb tenant:#{CONFIG["tenant"].to_s}"
Rails.logger.info "[INFO] Initializer:itam.rb redis:#{CONFIG["redis_server"]}"


ItMgmt::Application.config.action_mailer.smtp_settings = {}
"address port user_name password authentication enable_starttls_auto domain".split(" ").each do |config|
	ItMgmt::Application.config.action_mailer.smtp_settings[config.to_sym] = CONFIG["smtp"][config]
	ItMgmt::Application.config.action_mailer.default_url_options = { host: CONFIG["host"] }
end
Devise.setup do |config|
	 config.mailer_sender = CONFIG['recovery_password_from']
end
