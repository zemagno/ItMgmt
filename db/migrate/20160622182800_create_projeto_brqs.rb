class CreateProjetoBrqs < ActiveRecord::Migration
  def change
    create_table :projetos_brqs do |t|
      t.string :Projeto, :limit => 50
      t.string :IdtCodigoCentroCusto, :limit => 20
      t.string :NomCentroCusto, :limit => 100
      t.string :IdtCodigoCentroCustoPai, :limit => 20
      t.string :NomCentroCustoPai, :limit => 100
      t.string :NomTipoCentroCusto, :limit => 100
      t.string :NomProfissionalGestorProjeto, :limit => 100
      t.string :NomTipoOferta, :limit => 100
      t.string :NomCliente, :limit => 100
      t.date   :DtaFimPrevistoProjeto 
      t.date   :DtaInicioProjeto
      t.date   :DthFimProjeto
      t.string :NomStatusProjeto, :limit => 100
      t.string :NomFilial, :limit => 100

      t.timestamps
    end
  end
end
