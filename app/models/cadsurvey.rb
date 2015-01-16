class Cadsurvey < ActiveRecord::Base
  attr_accessible :bloqueado, :chave, :formulario, :key, :perguntas, :processado, :respostas

  serialize :formulario, Hash
  serialize :perguntas, Hash
  serialize :respostas, Hash
  
end
