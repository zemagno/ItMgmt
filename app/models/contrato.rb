class Contrato < ActiveRecord::Base
  belongs_to :tipocontrato
  belongs_to :fornecedor
  belongs_to :indicador_financeiro
  has_many :ci

  default_scope order('codcontrato ASC')
  
  def self.find_gen(param)
    begin 
       Contrato.find(param)
    rescue ActiveRecord::RecordNotFound
      Contrato.find_by_codcontrato(param)
    end
  end

  def to_s
    "#{codcontrato}:#{tipocontrato.descricao}"
  end
  
  define_index do
      indexes :codcontrato
      indexes :descricao
      indexes fornecedor(:nome), :as => :nomefornecedor
      indexes tipocontrato(:descricao), :as => :tipocontrato
      indexes :projetoCCTI
      indexes :projetoCCArea

      #has site_id  # se eu quiser quiser filtrar..
      #has tipoci_id
  end
end
