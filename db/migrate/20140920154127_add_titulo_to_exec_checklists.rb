class AddTituloToExecChecklists < ActiveRecord::Migration
  def change
    add_column :exec_checklists, :titulo, :string
  end
end
