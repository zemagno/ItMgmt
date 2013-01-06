class Task < ActiveRecord::Base
   belongs_to :author
   belongs_to :category
   belongs_to :site
   belongs_to :criticidade
 
   validates_presence_of :description
   validates_presence_of :status
   validates_presence_of :author
   validates_presence_of :category
   validates_presence_of :site
   validates_presence_of :criticidade
   
   def criado_em
        created_at.in_time_zone("Brasilia").strftime("%d/%m-%H:%M")
   end
   
   
   def self.ativos
     Task.find(:all, :order => "criticidade_id, created_at DESC", :conditions => "Ativo=1")
   end
   
   def self.todos
     Task.find(:all, :order => "criticidade_id, created_at DESC")
   end
     
end