class Dicdado < ActiveRecord::Base
  belongs_to :tipoci
  
  default_scope order('tipoci_id ASC, ordem ASC')
  
  validates :nome, :presence => { :message => " eh mandatorio" }
  validates :tipoci_id, :presence => { :message => " eh mandatorio" }
  validates :apelido, :format => { :with => /^[a-zA-Z]+$/,
       :message => "Somente Caracter Alfanumerico" }
  
  self.per_page = 20  

  define_index do
      indexes nome
      indexes tipoci(:tipo), :as => :tipoci
      indexes tipoci_id, :as => :tipoci_id, :sortable => true
      indexes ordem , :as => :ordem, :sortable => true
  end

end


