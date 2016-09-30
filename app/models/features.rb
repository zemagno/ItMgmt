class Features
	def self.has? (action)
		! CONFIG["hidden_features"].include? action
	end
	# TODO colocar a string acima numa arquivo dentro do config.
end