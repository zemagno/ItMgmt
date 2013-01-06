class CreateChamados < ActiveRecord::Migration
  def self.up
    create_table :chamados do |t|
      t.references :SubTipoChamado
      t.references :StatusChamado
      t.string :Solicitante
      t.string :Userid
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :chamados
  end
end
