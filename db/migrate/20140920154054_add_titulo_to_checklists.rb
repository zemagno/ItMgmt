class AddTituloToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :titulo, :string
  end
end
