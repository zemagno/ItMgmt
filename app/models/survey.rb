class Survey

include ActiveModel::Validations
include ActiveModel::Conversion
extend ActiveModel::Naming
include ActiveModel::AttributeMethods

attr_accessor :attributes,:bloqueado, :chave, :formulario, :key, :perguntas, :processado, :respostas
#attr_accessible :bloqueado, :chave, :formulario, :key, :perguntas, :processado, :respostas


def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value) if respond_to?(name)
    end
end


def persisted?
    false
end


end