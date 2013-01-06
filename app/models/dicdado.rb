class Dicdado < ActiveRecord::Base
  belongs_to :tipoci
  
  default_scope order('tipoci_id ASC, ordem ASC')
  
  validates :nome, :presence => { :message => " eh mandatorio" }
  validates :tipoci_id, :presence => { :message => " eh mandatorio" }
  
  self.per_page = 20  

end
