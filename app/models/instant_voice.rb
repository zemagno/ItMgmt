class InstantVoice < ActiveRecord::Base
  establish_connection :instant
  self.abstract_class = true
end