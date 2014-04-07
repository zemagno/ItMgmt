class PygmentsWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  # sidekiq_options retry: false
  
  def perform(snippet_id)
    ping_count = 3
    snippet = Snippet.find(snippet_id)
    result = `ping -q -c #{ping_count} #{snippet.plain_code}`  
    snippet.update_attribute(:highlighted_code)
    puts "Contador #{contador}"
  end
end
