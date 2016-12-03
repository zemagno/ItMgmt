class Parametro < ActiveRecord::Base

  attr_accessible :tipo, :subtipo, :valor

  validates :tipo, :presence =>  {    message: I18n.t("errors.parametro.tipo.presence")}
  validates :subtipo, :presence =>  {    message: I18n.t("errors.parametro.subtipo.presence")}

  default_scope { order('Tipo ASC') }

  def self.get(options)
    Rails.logger.debug "[DEBUG]Parametro.get(#{options})"
    p = Parametro.where(tipo: options[:tipo],subtipo: options[:subtipo]).first
    p.blank? ? "" : p.valor
  end

  def self.list(options)
    Rails.logger.debug "[DEBUG]Parametro.list(#{options})"
    r = []
    Parametro.where(tipo: options[:tipo]).each  { |p| r << [p.tipo,p.subtipo,p.valor] }
    r
  end

  # def ewal(parametro) # SEMUSO?
  #   eval(valor)
  # end

  def self.criar_parametros_email(_tipo)
    "TO CC SUBJECT BODY BCC".split.each do |_subtipo|
      Parametro.create(tipo: _tipo, subtipo: _subtipo)
    end
  end

  def self.apagar_parametros(_tipo)
    Parametro.destroy_all(tipo: _tipo)
  end

  def self.renomear_tipo_parametro(_old,_new)
    if ! _old.blank? and (_old != _new) then
      puts "PARAMETRO:  #{_old} ---> #{_new}"
    end
  end
end
