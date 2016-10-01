class Dicdado < ActiveRecord::Base
  belongs_to :tipoci
  
  default_scope order('tipoci_id ASC, ordem ASC')
  
  validates :nome, :presence => { :message => " eh mandatorio" }
  validates :tipoci_id, :presence => { :message => " eh mandatorio" }
  validates :apelido, :format => { :with => /^[a-zA-Z]+$/,
       :message => "Somente Caracter Alfanumerico" }
  
  self.per_page = 20  

  def nice_tipoci
      tipoci.nil? ? "" : tipoci.tipo
  end

  define_index do
      indexes nome, :as => :campo
      indexes apelido
      indexes valores
      indexes tipoci(:tipo), :as => :tipo
      indexes tipoci_id, :as => :tipoci_id, :sortable => true
      indexes ordem , :as => :ordem, :sortable => true
  end

end


