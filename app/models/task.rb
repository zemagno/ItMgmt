class Task < ActiveRecord::Base
  attr_accessible :Ativo, :author_id , :category_id , :chamado, :ci_id, :comentario , :criticidade_id, :Descricaorestrita, :description, :DocChange, :fornecedor_id, :nome, :publica, :site_id, :solicitante, :status_incidente_id, :sucesso, :tipotask  
  belongs_to :author
  belongs_to :category
  belongs_to :site
  belongs_to :criticidade
  belongs_to :fornecedor
  belongs_to :ci
  belongs_to :status_incidente

  validates_presence_of :description
  validates_presence_of :author
  validates_presence_of :category
  validates_presence_of :site
  validates_presence_of :criticidade
  #validates_presence_of :tipotask

  # validates_presence_of :nome

  after_save ThinkingSphinx::RealTime.callback_for(:task)

  def criado_em
    created_at.in_time_zone("Brasilia").strftime("%d/%m-%H:%M")
  end

  def alterado_em
    updated_at.in_time_zone("Brasilia").strftime("%d/%m-%H:%M")
  end


  def self.ativos
    Task.find(:all, :order => "criticidade_id, created_at DESC", :conditions => "Ativo=1")
  end

  def self.todos
    Task.find(:all, :order => "created_at DESC")
  end

  def self.abertas
    Task.joins(:status_incidente).where('status_incidentes.tipo="ABERTO" and ativo=1').order("criticidade_id, tasks.created_at DESC")
  end

  def self.ativas_nao_abertas
    Task.joins(:status_incidente).where('status_incidentes.tipo<>"ABERTO" and ativo=1').order("criticidade_id, tasks.created_at DESC")
  end

  def self.publicas
    Task.find(:all, :order => "criticidade_id, created_at DESC", :conditions => "Ativo=1 and publica=1")
  end

  def nome_autor
    author.name
  end

  def chave_ci
    ci.blank? ? "" : ci.status
  end

  def nome_cliente
    category.name
  end

  def nome_criticidade
    criticidade.name
  end

  def nome_site
    site.nome
  end

  def status
    status_incidente.blank? ? "" : status_incidente.status
  end



end
