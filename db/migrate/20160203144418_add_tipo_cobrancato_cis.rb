class AddTipoCobrancatoCis < ActiveRecord::Migration
  def up
 	 add_column :cis, :tipoCobranca, :integer
 	 execute %Q{ update cis set tipoCobranca=cobrar; }
 	 execute %Q{ update cis set tipoCobranca=0 where cobrar is null; }

  end

  def down
  	remove_column :cis, :tipoCobranca
  end
end
