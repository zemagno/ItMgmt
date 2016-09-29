class Features
	def self.has? (action)
		! Rails.configuration.hidden_features.include? action
	end
	# TODO colocar a string acima numa arquivo dentro do config.
end