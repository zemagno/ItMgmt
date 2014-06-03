class AddCobrarToCis < ActiveRecord::Migration
  def change
    add_column :cis, :cobrar, :boolean
    add_column :cis, :descricaocobranca, :string
  end
end
