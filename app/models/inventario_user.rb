class InventarioUser < ActiveRecord::Base
  # set_primary_key :login
  attr_accessible :hostname, :login
  default_scope where(:versao => 0)

  # has_many :sofwaresEmUso, through: : :attribute_key => 'issueTypes'

  def self.estacoes (_login)
  	# where(login: _login).pluck(:hostname)
  	# Ci.where(notificacao: _login, statusci_id: 1, tipoci_id: 46).map { |x|   x._hostname.blank? ? x.chave : x._hostname }
  	Ci.where(notificacao: _login, statusci_id: 1, tipoci_id: 46).pluck(:chave)
  end

end
