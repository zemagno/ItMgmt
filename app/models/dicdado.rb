class Dicdado < ActiveRecord::Base
  belongs_to :tipoci
  
  default_scope order('tipoci_id ASC, ordem ASC')
  
  validates :nome, :presence => {                          :message => I18n.t("errors.dicdado.nome.presence") }
  validates :tipoci_id, :presence => {                     :message => " eh mandatorio" }
  validates :apelido, :presence => {                       :message => I18n.t("errors.dicdado.apelido.presence") }
  validates :apelido, :format => { :with => /^[a-zA-Z0-9]+$/, :message => I18n.t("errors.dicdado.apelido.format") }
  
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


