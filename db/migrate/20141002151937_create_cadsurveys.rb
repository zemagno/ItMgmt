class CreateCadsurveys < ActiveRecord::Migration
  def change
    create_table :cadsurveys do |t|
      t.string :key
      t.text :formulario
      t.text :perguntas
      t.text :respostas
      t.boolean :bloqueado
      t.boolean :processado
      t.string :chave

      t.timestamps
    end
  end
end
