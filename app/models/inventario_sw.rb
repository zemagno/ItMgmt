class InventarioSw < ActiveRecord::Base
  # set_primary_key :hostname
  attr_accessible :hostname, :software

  # has_many :usuarios, :foreign_key => :hostname, :class_name => "InventarioUser"

  def self.quemUsa

  end

  def self.licencaEstacao(estacoes)
  	self.where("hostname IN (?)", estacoes).pluck(:software)
  end

  

end
