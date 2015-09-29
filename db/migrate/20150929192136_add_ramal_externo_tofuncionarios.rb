class AddRamalExternoTofuncionarios < ActiveRecord::Migration
  def change
  	 add_column :funcionarios, :ramalSendoExterno, :boolean
  end
end
