class AddCategoriaToCadrelatorios < ActiveRecord::Migration
  def change
    add_column :cadrelatorios, :categoria, :string,  :limit => 50
  end
end
