class AddIdtToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :IdLocalTrabalho, :integer
  end
end
