class AddChecklistToExecChecklist < ActiveRecord::Migration
  def change
    add_column :exec_checklists, :checklist_id, :integer
  end
end
