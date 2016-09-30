CONFIG = YAML.load_file("#{Rails.root.to_s}/config/itam.yml")[Rails.env]

# ItMgmt::Application.config.action_mailer.smtp_settings = {
#     :address              => CONFIG["smtp"]["address"],
#     :port                 => CONFIG["smtp"]["port"],
#     :user_name            => CONFIG["smtp"]["user_name"],
#     :password             => CONFIG["smtp"]["password"],
#     :authentication       => CONFIG["smtp"]["authentication"],
#     :enable_starttls_auto => CONFIG["smtp"]["enable_starttls_auto"]
#   }

# ItMgmt::Application.config.action_mailer.smtp_settings = {}
# "address port user_name password authentication enable_starttls_auto".split(" ").each do |config|
# 	ItMgmt::Application.config.action_mailer.smtp_settings[config.to_sym] = CONFIG["smtp"][config]
# end
