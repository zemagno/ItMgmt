class Cadrelatorio < ActiveRecord::Base
  attr_accessible :consulta, :nome, :descricao, :categoria, :tipoci_id

  belongs_to :tipoci

  define_index do
      indexes nome
      indexes descricao
      indexes categoria
      indexes tipoci(:tipo), :as => :tipo
  end


  def nome_tipoci
  	tipoci_id.nil? || tipoci_id==0 ? "" : tipoci.tipo
  end
end
