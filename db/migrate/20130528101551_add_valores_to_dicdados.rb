class AddValoresToDicdados < ActiveRecord::Migration
  def change
    add_column :dicdados, :valores, :string, :limit => 500
  end
end

