class CreateStatusChamados < ActiveRecord::Migration
  def self.up
    create_table :status_chamados do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :status_chamados
  end
end
