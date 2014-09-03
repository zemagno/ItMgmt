class RemoveContratoFromCis < ActiveRecord::Migration
  def up
  	remove_column :cis, :contrato_id
  end

  def down
  end
end

