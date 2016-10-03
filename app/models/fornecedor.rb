class Fornecedor < ActiveRecord::Base
	self.table_name = "fornecedores"
	belongs_to :areafornecedor
    self.per_page = 15
	default_scope order('nome ASC')

	 define_index do
      indexes :nome
      indexes :nomecompleto
     end
 
end
