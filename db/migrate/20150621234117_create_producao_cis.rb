class CreateProducaoCis < ActiveRecord::Migration
  def change
    create_table :producao_cis do |t|
      t.string :job, :limit => 30
      t.integer :ci_id
      t.string :status, :limit => 10
      t.datetime :date
      t.string :detalhe

      t.timestamps
    end
  end
end
