class EnviaEmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  # sidekiq_options retry: false
  
  def perform(snippet_id)
    #snippet = Snippet.find(snippet_id)
    #uri = URI.parse("http://pygments.appspot.com/")
    #request = Net::HTTP.post_form(uri, lang: snippet.language, code: snippet.plain_code)
    #snippet.update_attribute(:highlighted_code, request.body)
    ping_count = 3
    snippet = Snippet.find(snippet_id)
    result = `ping -q -c #{ping_count} #{snippet.plain_code}`  
    snippet.update_attribute(:highlighted_code, result)
  end
end
