class CreateLicenciamentoMsDeParas < ActiveRecord::Migration
  def change
    create_table :licenciamento_ms_de_paras do |t|
      t.string :licencaOrig
      t.string :licenca
      t.string :catLicenca

      t.timestamps
    end
  end
end
