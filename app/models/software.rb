class Software < ActiveRecord::Base
  attr_accessible :custoMensal, :fabricante, :software, :status

  has_many :usuarios  through: :inventario_sws :attribute_key =>

  def self.licencasExistentes
  	self.all.map{|s| {software: s.software,custoMensal: s.custoMensal,status: s.status}}
  end
end
