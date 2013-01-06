class CreateSubTipoChamados < ActiveRecord::Migration
  def self.up
    create_table :sub_tipo_chamados do |t|
      t.references :TipoChamado
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :sub_tipo_chamados
  end
end
