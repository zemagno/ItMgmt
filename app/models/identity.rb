class Identity < ActiveRecord::Base
  attr_accessible :login, :ADUser, :ADCriadoem, :ADLastLogon, :ADExpiraem, :ADDataDesligamento, :ADUsuarioTipo, :GoogleprimaryEmail, :GooglelastLoginTime, :GoogleorgUnitPath,  :Googlesuspended, :GooglesuspensionReason, :GoogleLicenses

  before_save :sanitizar_campos


  def detalhes
    idts = []
    ["AD","Google","RM"].each do |domain|
      self.attribute_names.each do |attr|
        idts << ["#{domain} #{$1}",self.attributes[attr]] if attr =~ /^#{domain}(\w+)$/
        # @idts << ["AD #{$1}",i.attributes[attr]] if attr =~ /^Google(\w+)$/
      end
    end
    idts

  end


  private
  def sanitizar_campos
    self.GoogleprimaryEmail.gsub!(/@[^\s]+/,"") if ! self.GoogleprimaryEmail.nil?
    # self.Googlesuspended.upcase! if ! self.GoogleprimaryEmail.nil?

  end
end
