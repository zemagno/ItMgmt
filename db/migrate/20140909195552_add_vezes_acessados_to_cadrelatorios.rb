class AddVezesAcessadosToCadrelatorios < ActiveRecord::Migration
  def change
    add_column :cadrelatorios, :qtdeacessos, :integer
  end
end
