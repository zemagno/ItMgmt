class RenameFuncionarios < ActiveRecord::Migration
  def change 
    execute %Q{ DROP TABLE funcionarios ; }
  	create_table :funcionarios, id: false   do |t|
      t.string   :Login, :limit => 30
      t.integer  :NumMatrProfissional
      t.string   :NomProfissional, :limit => 50
      t.date     :DtaAdmissao
      t.date     :DtaDemissao
      t.string 	 :NomEmailBRQ, :limit => 50 
      t.string   :IdtCPF, :limit => 20
      t.string   :IdtRG, :limit => 20
      t.string   :IdtCodigoCentroCusto , :limit => 10
      t.string   :NomCentroCusto
      t.string   :NomTipoCentroCusto
      t.string   :OwnerCC
      t.string   :IdtCodigoSecao, :limit => 10
      t.string   :NomLocalTrabalho , :limit => 50
      t.string   :NomCidadeLocalTrabalho, :limit => 50
      t.string   :IdtCentroCustoTorre, :limit => 10
      t.string   :DscCentroCustoTorre, :limit => 50
      t.string   :NomAlocacao, :limit => 50
    end


   execute %Q{ ALTER TABLE funcionarios ADD PRIMARY KEY (Login); }
  end
end


