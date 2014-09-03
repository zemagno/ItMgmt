class DelTipociIdFromExecChecklist < ActiveRecord::Migration
  def up
    remove_column :exec_checklists, :tipoci_id
  end

  def down
    add_column :exec_checklists, :tipoci_id, :integer
  end
end
