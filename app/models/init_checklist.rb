class InitChecklist 

  # transform em um ActiveModel
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  def persisted?
    false
  end

  
  attr_accessor :agrupar, :checklist_id, :cis, :descricao, :fimexec, :inicioexec, :users

  validates_presence_of :descricao , :message => "Descricao eh obrigatoria"
  validates_length_of :descricao, :maximum => 250

  validates_presence_of :inicioexec , :message => "Data de Inicio eh obrigatoria"
  validates_presence_of :fimexec , :message => "Data de Fim eh obrigatoria" #, :if  => lambda { || inicioexec==fimexec }

  validate :valid_date_range_required

  def valid_date_range_required
    if (inicioexec && fimexec) && (inicioexec > fimexec)
      errors.add("Data de termino tem que ser posterior a data de inicio")
    end
  end


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
end

