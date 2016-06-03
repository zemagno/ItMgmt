class InventarioSw < ActiveRecord::Base
  # set_primary_key :hostname
  attr_accessible :hostname, :software

  has_many :logins,
           :foreign_key => :hostname,
           :primary_key => :hostname,
           :class_name => "InventarioUser"

  after_create :post_create_processing

  default_scope where(:versao => 0)

  def self.quemUsa

  end

  def self.LicencasPorEstacao(estacoes)
    lpe = []
    estacoes.each do |e|
      lpe << [e,self.where("hostname IN (?)", e).pluck(:software)]
    end
    lpe
  end

  def self.licencaEstacao(estacoes)
  	self.where("hostname IN (?)", estacoes).pluck(:software)
  end

  private
  
  def post_create_processing
    self.total= 0
  end

  

end
