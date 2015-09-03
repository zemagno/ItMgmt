class AcertaFuncionarios < ActiveRecord::Migration
  def change
  	add_column :funcionarios, :DtaRemocaoAcesso, :Date, :limit => 30
  	add_column :funcionarios, :FlgIndicaRetorno, :boolean
  	add_column :funcionarios, :NomGestorProfissional, :string, :limit => 50
  	add_column :funcionarios, :NomEmailGestorProfissional, :string, :limit => 30
  	add_column :funcionarios, :NomEstadoLocalTrabalho, :string, :limit => 10
    remove_column :funcionarios, :OwnerCC
  end
end


