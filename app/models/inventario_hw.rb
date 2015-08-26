class InventarioHw < ActiveRecord::Base
  attr_accessible :dataUltimoLogin, :fabricante, :hd, :hostname, :userid, :memoria, :modelo, :numSerie, :processador, :site, :so
end
