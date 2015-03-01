class Fornecedor < ActiveRecord::Base
	set_table_name "fornecedores"
	belongs_to :areafornecedor
    self.per_page = 15
	default_scope order('nome ASC')

	 define_index do
      indexes :nome
      indexes :nomecompleto
     end
 
end
