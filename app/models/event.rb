class Event < ActiveRecord::Base
  attr_accessible :tipo, :subtipo, :nivel, :valor


# TODO - colocar o nao processado aqui... e nao no bd
  def self.register(type, subtype,level, value)
  	Event.new(tipo: type, subtipo: subtype, nivel: level, valor: value).save!
  end


  def self.subscribe
  end

  

  # define_index do
  #     indexes type
  #     indexes subtype
  #     index level
  #     index value
  # end
end
