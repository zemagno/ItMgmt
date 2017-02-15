class Cadrelatorio < ActiveRecord::Base
  attr_accessible :consulta, :nome, :descricao, :categoria, :tipoci_id, :ultimoacesso, :qtdeacessos, :dashboard, :ordem, :justificativa, :solicitante, :tipoExibicao
  audited
  
  @@dashboards = nil

  belongs_to :tipoci


  validates :nome, :presence => {:message => I18n.t("errors.cadrelatorio.nome.presence")}
  validates :nome, :uniqueness => {:case_sensitive => false, :message => I18n.t("errors.cadrelatorio.nome.uniqueness")}
  validates :nome, format: { with: /\A[a-zA-Z0-9\_\-\<\>\.\/]+\z/, message: I18n.t("errors.cadrelatorio.nome.format") }
  validates :descricao, :presence => {:message => I18n.t("errors.cadrelatorio.descricao.presence")}

  default_scope { order('ordem ASC') }

  after_save :invalidate_caches, ThinkingSphinx::RealTime.callback_for(:cadrelatorio)
  after_destroy :invalidate_caches

  def AtualizaEstatisticas
    begin
      self.ultimoacesso = DateTime.now.to_date
      self.qtdeacessos = self.qtdeacessos.to_i + 1
      save!
    rescue
      Rails.logger.error "Error[CR0001] - Nao consegui atualizar estatisticas..."
    end
  end

  # def getPainel
  #   r = Cadrelatorio.find_ all_by_painel(1)

  # end

  def nice_tipoci
    tipoci.nil? ? "" : tipoci.tipo
    
  end

  def self.execute(sql)
    mysql_res = ActiveRecord::Base.connection.execute("SET SESSION group_concat_max_len = 10000;")
    mysql_res = ActiveRecord::Base.connection.execute(sql)
    mysql_res
  end

  def self.execute_amostra(sql,size)
    sql = "#{sql} limit #{size}"
    self.execute(sql)
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
    Rails.logger.debug "[DEBUG] Cadrelatorio.getDashboards - Recuperando lista de dashboards"
    # Rails.logger.debug "[DEBUG]     [@@dashboards]" if ! @@dashboards.nil?
    @@dashboards = @@dashboards || Cadrelatorio.pluck(:dashboard).join(" ").split(" ").uniq.sort
    @@dashboards
  end



  def nome_tipoci
    tipoci_id.nil? || tipoci_id==0 ? "" : tipoci.tipo
  end

  private
  def invalidate_caches
    Rails.logger.debug "[DEBUG] Cadrelatorio.invalidate_caches"
    # Rails.logger.debug "[DEBUG]     [@@dashboards]" if @@dashboards
    @@dashboards = nil
  end
end
