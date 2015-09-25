class InventarioUser < ActiveRecord::Base
  # set_primary_key :login
  attr_accessible :hostname, :login

  # has_many :sofwaresEmUso, through: : :attribute_key => 'issueTypes'
end
