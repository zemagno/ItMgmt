class Site < ActiveRecord::Base
  validates_presence_of :nome, :estado

default_scope order('nome ASC')

end
