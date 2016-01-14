class Atributo < ActiveRecord::Base
   audited associated_with: :ci
  belongs_to :ci
  belongs_to :dicdado
  

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
  
end

