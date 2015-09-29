class CustoSoftware < ActiveRecord::Base
  attr_accessible :custoMensal, :fabricante, :software, :status

  def self.licencasExistentes
  	self.all.map{|s| {software: s.software,custoMensal: s.custoMensal,status: s.status}}
  end
end
