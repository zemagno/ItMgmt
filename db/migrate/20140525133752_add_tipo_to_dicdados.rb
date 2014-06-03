class AddTipoToDicdados < ActiveRecord::Migration
  def change
    add_column :dicdados, :tipo, :string
  end
end
