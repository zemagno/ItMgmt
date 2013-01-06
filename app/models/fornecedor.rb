class Fornecedor < ActiveRecord::Base
	belongs_to :areafornecedor
    self.per_page = 15
	default_scope order('nome ASC')
 
end
