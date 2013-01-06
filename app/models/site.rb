class Site < ActiveRecord::Base
  validates_presence_of :nome

default_scope order('nome ASC')

end
