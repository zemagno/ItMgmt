class Addexcecaofuncionariointernocomoffice365 < ActiveRecord::Migration
  def change
     add_column :funcionarios, :customExternoComOffice365, :boolean
  end
end
