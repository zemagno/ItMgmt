class Relacionamento < ActiveRecord::Base
  belongs_to :impactado, :class_name => "Ci"
  belongs_to :dependente, :class_name => "Ci"
  belongs_to :dependentes_all, :class_name => "Ci", :foreign_key => "dependente_id"

def to_s
      "[#{impactado.chave}] depende de [#{dependente.chave}]"  
  end

 before_save :default_values
  def default_values
    self.tipo  ||= 0
  end

end
