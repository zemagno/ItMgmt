class JobsAsync < ActiveRecord::Migration
  def change
     create_table :job_asyncs do |t|
  	  t.string :tipo
  	  t.integer :record_id
      t.text :params, :limit => 4096
      t.integer :status, default: 0, null: false
     end
  end
end



      # t.string   :nome           # nome generico - exemplo: Provisionamento Servidor
      # t.string   :titulo         # nome especifico - exemplo: Provisionamento Servidor Srv361
      # t.date     :dataInicio
      # t.date     :dataFim
      # t.integer  :status, default: 0, null: false
      # t.text     :docs, :limit => 4096
      # t.string   :lider
