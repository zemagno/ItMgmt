class CreateProducaoAds < ActiveRecord::Migration
  def change
    create_table :producao_ads do |t|
      t.string :userid
      t.string :acao
      t.string :parametro
      t.boolean :processado

      t.timestamps
    end
  end
end
