ThinkingSphinx::Index.define :cadrelatorio, :with => :real_time do
# ThinkingSphinx::Index.define :cadrelatorio, :with => :active_record do
    indexes nome, :type => :string
    indexes descricao, :type => :string
    indexes categoria, :type => :string
    indexes dashboard, :type => :string
    # indexes tipoci(:tipo), :as => :tipoci
    indexes nice_tipoci
  end


# module CustomRealTimeIndexCadRelatorio

# 	#ActiveRecord::Base::scope :licencas_em_estoque, ->(search) { ActiveRecord::Base::where("statusci_id = 8 and chave LIKE ?", "#{search}%") }
# 	# And then you'd call it like this:
# 	# YourModel.active.name_like("Bunnies")

# 	# def licencas_em_estoque(search)
#  #        ActiveRecord::Base::where("statusci_id = 8 and chave LIKE ?","#{search}%")
#  #    end

#    #  # puts "Definindo Delete licenca"
#    #  def libera_estacao
#   	# 	self.statusci_id = 8
#   	# 	self.CCDebito = ""
#   	# 	self.ProjetoDebito = ""
#   	# 	self.Owner = "BRQ"
#   	# 	self.notificacao = ""
#   	# 	save!
#   	# end

#    #  def desaloca_licenca
#    #    self.statusci_id = 8
#    #    self.CCDebito = ""
#    #    self.ProjetoDebito = ""
#    #    self.Owner = "BRQ"
#    #    self.notificacao = ""
#    #    save!
#    #  end
#    after_save ThinkingSphinx::RealTime.callback_for(:cadrelatorio)

# end

# Cadrelatorio.send(:include, CustomRealTimeIndexCadRelatorio)