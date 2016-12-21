class Dicdado < ActiveRecord::Base
  belongs_to :tipoci

  attr_accessible :nome, :ordem, :url, :tipoci_id, :descricao ,:valores ,:apelido  ,:tipo , :regex, :mandatorio  ,:tooltip     ,:comentarios

  default_scope { order('tipoci_id ASC, ordem ASC') }

  validates :nome, :presence => {                          :message => I18n.t("errors.dicdado.nome.presence") }
  validates :tipoci_id, :presence => {                     :message => " eh mandatorio" }
  validates :apelido, :presence => {                       :message => I18n.t("errors.dicdado.apelido.presence") }
  validates :apelido, :format => { :with => /\A[a-zA-Z0-9]+\z/, :message => I18n.t("errors.dicdado.apelido.format") }

  self.per_page = 20

  after_save ThinkingSphinx::RealTime.callback_for(:dicdado)

  def nice_tipoci
    tipoci.nil? ? "" : tipoci.tipo
  end

end
