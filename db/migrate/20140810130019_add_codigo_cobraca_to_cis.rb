class AddCodigoCobracaToCis < ActiveRecord::Migration
  def change
    add_column :cis, :codigocobranca, :string
  end
end
