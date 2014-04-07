class TemplatesEmail < ActiveRecord::Base
  attr_accessible :nome, :subtipo, :template, :tipo, :sync
  after_create :criar_parametros
  after_destroy :apagar_parametros
  before_save :renomear_parametros

  def full_nome
  	  "#{nome} - #{sync ? 'Browse' : 'Direto'}"
  end

  # TODO isso da para virar metaprograming
  def criar_parametros
  		Parametro.criar_parametros_email(template)
  end
  def apagar_parametros
  	 	Parametro.apagar_parametros(template)
  end
  def renomear_parametros
       Parametro.renomear_tipo_parametro(template_was,template)
  end

end
