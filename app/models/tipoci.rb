class Tipoci < ActiveRecord::Base
   attr_accessible :Descricao, :defCampo1, :defCampo2, :defCampo3, :defCampo4, :tipo, :Owner
     has_many :dicdados
   
	default_scope order('tipo ASC')

	OWNER_SCREEN_SIZE = 20
	OWNER_MAX_LENGTH = 20

	def to_s
		puts "#{tipo}:#{Owner}"
		
	end
   
end
