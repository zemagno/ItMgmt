class AlterCi < ActiveRecord::Migration
  def self.up
    add_column :cis, :CustoMensal, :integer
    add_column :cis, :Owner, :string
    add_column :cis, :CC, :string
  end

  def self.down
    remove_column :cis, :CustoMensal
    remove_column :cis, :Owner
    remove_column :cis, :CC
  end
end
