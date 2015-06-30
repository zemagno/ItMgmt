class UraDb < ActiveRecord::Base
  establish_connection "ura"
  self.abstract_class = true
end