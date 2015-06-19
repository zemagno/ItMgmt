class CreateMapaPosicao < ActiveRecord::Migration
  def up
    create_table :mapa_posicaos, id: false   do |t|
      t.string :NomSite
      t.string :NomAndarSite
      t.string :NomTipoPosicao
      t.integer :FlgContabilizaAlocacao
      t.integer :QtdTotalTipoPosicao
      t.integer :NomPosicaoAndarSite
      t.integer :FlgReserva
      t.integer :NumMatrProfissional
      t.string :LoginProfissional
      t.string :LoginGestor
    end
  end

  def down
    drop_table :mapa_posicaos
  end
end
