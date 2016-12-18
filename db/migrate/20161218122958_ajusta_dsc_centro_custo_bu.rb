class AjustaDscCentroCustoBu < ActiveRecord::Migration
  def change
  	change_column :funcionarios, :DscCentroCustoBU, :string, limit: 50;    
  end
end
