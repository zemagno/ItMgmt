class MudarCampoValorEvento < ActiveRecord::Migration
  def change
  	change_column :events, :valor, :text, limit: 65535     
  end
end
