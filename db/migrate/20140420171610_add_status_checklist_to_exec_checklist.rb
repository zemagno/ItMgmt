class AddStatusChecklistToExecChecklist < ActiveRecord::Migration
  def change
    add_column :exec_checklists, :status_checklist_id, :integer
  end
end
