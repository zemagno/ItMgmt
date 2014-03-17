class TemplatesEmail < ActiveRecord::Base
  attr_accessible :nome, :subtipo, :template, :tipo, :sync
  after_create :criar_parametros
  after_destroy :apagar_parametros

  def full_nome
  	  "#{nome} - #{sync ? 'Browse' : 'Direto'}"
  end

  # TODO isso da para virar metaprograming
  def criar_parametros
  	puts "ops..vou criar os parametros para #{template}"
  	Parametro.criar_parametros_email(template)
  end
  def apagar_parametros
  	puts "ops..vou apagar os parametros para #{template}"
  	Parametro.apagar_parametros(template)
  end

end
