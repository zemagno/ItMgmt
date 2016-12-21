class Features
	def self.has? (action)
		! CONFIG["hidden_features"].include? action
	end
end