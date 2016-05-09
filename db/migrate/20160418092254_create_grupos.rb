class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.string :nome, :limit => 50
      t.text :membros, :limit => 16.megabytes - 1
      t.string :solicitante, :limit => 50
      t.string :descricao
      t.date :dataCriacao
      t.date :dataValidade
      t.string :chamado, :limit => 50
      t.timestamps
    end
  end
end
