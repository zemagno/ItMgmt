class CreatePedidos < ActiveRecord::Migration
  def self.up
    create_table :pedidos do |t|
      t.string :requisicao, :limit => 20
      t.string :solicitante, :limit => 40
      t.string :loginUsuario, :limit => 20
      t.date :dataPedido
      t.date :dataAutorizacao
      t.date :dataSolicitacaoCompras
      t.date :dataEntrega
      t.string :comprador, :limit => 20
      t.references :site
      t.string :ativo
      t.integer :custoEstimado
      t.string :pedidoResumido, :limit => 40
      t.string :observacao
      t.string :CCUN, :limit => 6
      t.string :projetoUN, :limit => 30
      t.string :ccTI, :limit => 6
      t.string :projetoTI, :limit => 30
      t.references :status

      t.timestamps
    end
  end

  def self.down
    drop_table :pedidos
  end
end
