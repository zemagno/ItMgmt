class AddContratoToContratos < ActiveRecord::Migration
  def change
    add_column :contratos, :contrato, :string
  end
end
