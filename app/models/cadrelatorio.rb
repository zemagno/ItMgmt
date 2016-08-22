class Cadrelatorio < ActiveRecord::Base
  attr_accessible :consulta, :nome, :descricao, :categoria, :tipoci_id, :ultimoacesso, :qtdeacessos, :dashboard, :ordem

  belongs_to :tipoci

  default_scope order('ordem ASC')

  define_index do
    indexes nome
    indexes descricao
    indexes categoria
    indexes dashboard
    indexes tipoci(:tipo), :as => :tipo
  end


  def AtualizaEstatisticas
    self.ultimoacesso = DateTime.now.to_date
    self.qtdeacessos = self.qtdeacessos.to_i + 1
    save!
  end

  def getPainel
    r = Cadrelatorio.find_all_by_painel(1)

  end

  def self.find_gen(param)
    
    begin
      if param =~ /^[1-9]\d*$/
        Cadrelatorio.find(param)
      else
        Cadrelatorio.find_by_nome(param)
      end
    rescue ActiveRecord::RecordNotFound
      Cadrelatorio.find_by_nome(param)
    end
  end



  def nome_tipoci
    tipoci_id.nil? || tipoci_id==0 ? "" : tipoci.tipo
  end
end
