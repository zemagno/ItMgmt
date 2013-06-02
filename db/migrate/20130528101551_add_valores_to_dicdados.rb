class AddValoresToDicdados < ActiveRecord::Migration
  def change
    add_column :dicdados, :valores, :string
  end
end
