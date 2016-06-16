class CreateIncidentes < ActiveRecord::Migration
  def change
    create_table :incidentes do |t|
      t.string :nome
      t.text :descricao
      t.text :descricao_solucao
      t.text :info_restrita
      t.datetime :data_inicio_evento
      t.datetime :data_fim_evento
      t.boolean :evento_publico
      t.integer :ci_id
      t.string :tipo_incidente
      t.string :status
      t.string :criticidade
      t.string :solicitante
      t.string :usuario
      t.string :site
      t.string :chamados
      t.integer :tempo_target_sla
      t.integer :tempo_dentro_sla
      t.integer :impactados
      t.integer :total_impactados
      t.decimal :perc_impactados, :precision => 10, :scale => 2
      t.integer :incidente_tipo_impacto_id
      t.decimal :perda_sla, :precision => 10, :scale => 2
      t.string :ci
      t.string :ci_descricao

      t.timestamps
    end
  end
end
