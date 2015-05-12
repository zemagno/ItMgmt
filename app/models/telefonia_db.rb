class TelefoniaDb < ActiveRecord::Base
  establish_connection "telefonia"
  self.abstract_class = true
end

