class RmDb < ActiveRecord::Base
  establish_connection :rm
  self.abstract_class = true
  attr_accessible 
end
