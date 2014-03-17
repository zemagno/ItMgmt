class AddAliasToDicdados < ActiveRecord::Migration
  def change
    add_column :dicdados, :apelido, :string
  end
end
