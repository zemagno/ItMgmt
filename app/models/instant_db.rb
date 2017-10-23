class InstantDb < ActiveRecord::Base
  establish_connection :instant
  self.abstract_class = true
  attr_accessible 
end