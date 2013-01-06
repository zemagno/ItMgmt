class Relacionamento < ActiveRecord::Base
  belongs_to :impactado, :class_name => "Ci"
  belongs_to :dependente, :class_name => "Ci"

def to_s
      "[#{impactado.chave}] depende de [#{dependente.chave}]"  
  end

end
