class Task < ActiveRecord::Base
   belongs_to :author
   belongs_to :category
   belongs_to :site
   belongs_to :criticidade
   belongs_to :fornecedor
   #belongs_to :tipotask
 
   validates_presence_of :description
   validates_presence_of :status
   validates_presence_of :author
   validates_presence_of :category
   validates_presence_of :site
   validates_presence_of :criticidade
   #validates_presence_of :tipotask   
   
   # validates_presence_of :nome
   
   def criado_em
        created_at.in_time_zone("Brasilia").strftime("%d/%m-%H:%M")
   end
   
   
   def self.ativos
     Task.find(:all, :order => "criticidade_id, created_at DESC", :conditions => "Ativo=1")
   end
   
   def self.todos
     Task.find(:all, :order => "criticidade_id, created_at DESC")
   end

   def self.publicas
    Task.find(:all, :order => "criticidade_id, created_at DESC", :conditions => "Ativo=1 and publica=1")
  end

   def nome_autor
    author.name
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
     
end