class TemplatesEmail < ActiveRecord::Base
  attr_accessible :nome, :subtipo, :template, :tipo, :sync
  after_create :criar_parametros
  after_destroy :apagar_parametros
  before_save :renomear_parametros
  default_scope order('tipo ASC, subtipo ASC')

  # TODO se mudar o tipo fica orfao de parametro..

  def full_nome
  	  "#{nome} - #{sync ? 'Browse' : 'Direto'}"
  end

  def self.find_by_tipo_and_subtipo(_tipo,_subtipo)
      templates_email = TemplatesEmail.find_all_by_tipo_and_subtipo(_tipo,"")
      templates_email.concat(TemplatesEmail.find(:all, :conditions => ["tipo = ? AND subtipo like ?", _tipo, "%#{_subtipo}%"]))
      templates_email
  end


  # TODO isso da para virar metaprograming
  def criar_parametros
    	Parametro.criar_parametros_email(template) if sync # so crio se for via browser (sync)
  end
  def apagar_parametros
  	 	Parametro.apagar_parametros(template)
  end
  def renomear_parametros
       Parametro.renomear_tipo_parametro(template_was,template)
  end

end
