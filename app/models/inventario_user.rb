class InventarioUser < ActiveRecord::Base
  # set_primary_key :login
  attr_accessible :hostname, :login
  default_scope where(:versao => 0)

  # has_many :sofwaresEmUso, through: : :attribute_key => 'issueTypes'

  def self.estacoes (_login)
  	where(login: _login).pluck(:hostname)
  end

end
