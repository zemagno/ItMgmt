


Rails.logger.info "[INFO] Initializer:session_store.rb - session - redis://#{CONFIG['redis_server']}/#{CONFIG['tenant']}/session"
# ItMgmt::Application.config.session_store :cookie_store, :key => '_itmgmt_session'
ItMgmt::Application.config.session_store :redis_store , servers: "redis://#{CONFIG['redis_server']}/#{CONFIG['tenant']}/session"
Rails.logger.debug "[DEBUG] ItMgmt::Application.config.session_store: #{ItMgmt::Application.config.session_store}"



# # Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# ItMgmt::Application.config.session_store :active_record_store
