class Atributo < ActiveRecord::Base
  audited associated_with: :ci
  attr_accessible  :ci_id ,:dicdado_id,:valor
  
  belongs_to :ci  ,   touch: true
  belongs_to :dicdado

  after_commit  ThinkingSphinx::RealTime.callback_for(:ci,[:ci]) #, :debug_atributo
  #after_touch :clear_association_cache

  def self.esta_em_uso?(iddic)
    self.where(:dicdado_id => iddic).exists?
  end

  # def com_valores
  #   Atributo.where("valor is not null and valor <> ''")
  # end

  def to_s
    "#{id} : #{ci_id}/#{ci.chave} : #{dicdado.nome} : #{valor} : #{ci.nice_tipoci}<>#{dicdado.nice_tipoci}"
  end


  #define_index do
  #    indexes valor as :valor
  #    indexes dicdado(:nome)
  #end

  private
  def debug_atributo
     Rails.logger.debug "Info[I00100] - after_update #{ci_id} - #{ci.chave} - #{ci.nice_atributos}"
  end

end
