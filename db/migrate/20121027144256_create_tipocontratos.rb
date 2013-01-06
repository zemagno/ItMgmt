class CreateTipocontratos < ActiveRecord::Migration
  def self.up
    create_table :tipocontratos do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :tipocontratos
  end
end
