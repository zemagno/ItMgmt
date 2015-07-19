class IndiceMapaPosicao < ActiveRecord::Migration
  def self.up
  	add_index :mapa_posicaos, :LoginProfissional
  	add_index :mapa_posicaos, :LoginGestor
  end

  def self.down
  	remove_index :mapa_posicaos, :LoginProfissional
  	remove_index :mapa_posicaos, :LoginGestor
  end
end
