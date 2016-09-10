class Cadrelatorio < ActiveRecord::Base
  attr_accessible :consulta, :nome, :descricao, :categoria, :tipoci_id, :ultimoacesso, :qtdeacessos, :dashboard, :ordem

  belongs_to :tipoci

  # validates :nome, :presence => {:message => " eh mandatorio"}
  # validates :nome, :uniqueness => {:case_sensitive => false, :message => " jah existe."}
  # validates :nome, format: { with: /^[a-zA-Z0-9\_\-\<\>\.\/]+$/, message: "deve conter somente caracteres alphanumericos" }

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

  def duplicar(novoNome)
    newCad = dup 
    newCad.nome  = novoNome
    newCad.save
    newCad
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

  def self.getDashboards
    Cadrelatorio.pluck(:dashboard).join(" ").split(" ").uniq.sort
  end



  def nome_tipoci
    tipoci_id.nil? || tipoci_id==0 ? "" : tipoci.tipo
  end
end
