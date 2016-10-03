class AddRazaoToCadrelatorios < ActiveRecord::Migration
  def change
    add_column :cadrelatorios, :justificativa, :string
    add_column :cadrelatorios, :solicitante, :string
  end
end
