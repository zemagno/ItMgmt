class Criticidade < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name,:alertacor
  
  def critico?
    self.id==1
  end
  
end
