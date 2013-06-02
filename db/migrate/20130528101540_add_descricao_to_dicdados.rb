class AddDescricaoToDicdados < ActiveRecord::Migration
  def change
    add_column :dicdados, :descricao, :string
  end
end
