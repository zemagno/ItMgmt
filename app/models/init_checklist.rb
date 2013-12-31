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

  validates_presence_of :inicioexec , :message => "Data Inicio Obrigatoria"
  validates_presence_of :fimexec , :message => "Data Fim obrigatoria" #, :if  => lambda { || inicioexec==fimexec }

  validate :valid_date_range_required

  def valid_date_range_required
    if (inicioexec && fimexec) && (inicioexec > fimexec)
      errors.add(:fimexec, "tem que ser posterior ao inicio")
    end
  end


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
end

