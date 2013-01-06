class Criticidade < ActiveRecord::Base
  validates_presence_of :name
  
  def critico?
    self.id==1
  end
  
end
