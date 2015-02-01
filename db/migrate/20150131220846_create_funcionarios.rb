class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios, id: false   do |t|
      t.string :Login, :limit => 30
      t.integer :Matricula
      t.string :Nome
      t.date :DataAdmissao
      t.date :DataDemissao
      t.string :Email
      t.string :CPF, :limit => 20
      t.string :Identidade, :limit => 20
      t.string :CodigoCC , :limit => 6
      t.string :NomeCC
      t.string :NomeTipoCC
      t.string :OwnerCC
      t.string :CodigoSecao, :limit => 10
      t.string :NomeLocalTrabalho
      t.string :NomeCidadeTrabalho
      t.string :CCTorre, :limit => 6
      t.string :DescCCTorre
    end


   execute %Q{ ALTER TABLE Funcionarios ADD PRIMARY KEY (Login); }
  end
end
