class Atributo < ActiveRecord::Base
  belongs_to :ci
  belongs_to :dicdado

  def self.esta_em_uso?(iddic)
    self.where(:dicdado_id => iddic).exists?
  end

  def to_s
      "#{id} : #{ci_id}/#{ci.chave} : #{dicdado.nome} : #{valor} : #{ci.tipoci.tipo}<>#{dicdado.tipoci.tipo}"  
  end
  
end
