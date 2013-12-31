class AddTipoChecklistToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :tipo_checklist_id, :integer
  end
end
