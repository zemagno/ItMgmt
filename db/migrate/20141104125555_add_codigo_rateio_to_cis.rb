class AddCodigoRateioToCis < ActiveRecord::Migration
  def change
    add_column :cis, :codigorateio, :string, :limit => 20
  end
end
