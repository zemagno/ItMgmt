class InventarioSw < ActiveRecord::Base
  # set_primary_key :hostname
  attr_accessible :hostname, :software

  def self.licencaEstacao(estacoes)
  	self.where("hostname IN (?)", estacoes).pluck(:software)
  end

  

end
