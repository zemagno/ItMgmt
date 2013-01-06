class CreateContratos < ActiveRecord::Migration
  def self.up
    create_table :contratos do |t|
      t.string :codcontrato
      t.string :descricao
      t.decimal :valormensal, :precision => 10, :scale => 2
      t.references :tipocontrato
      t.references :fornecedor
      t.date :datainicio
      t.date :datafim
      t.date :datarenovacao
      t.references :indicador_financeiro
      t.string :projetoCCTI
      t.string :projetoCCArea

      t.timestamps
    end
  end

  def self.down
    drop_table :contratos
  end
end
