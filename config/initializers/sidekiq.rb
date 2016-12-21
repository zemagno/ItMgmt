Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{CONFIG['redis_server']}/#{CONFIG['tenant']}" }
  #{CONFIG['redis_server']}/#{CONFIG['tenant']}
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{CONFIG['redis_server']}/#{CONFIG['tenant']}" }
end