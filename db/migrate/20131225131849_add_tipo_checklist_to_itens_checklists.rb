class AddTipoChecklistToItensChecklists < ActiveRecord::Migration
  def change
    add_column :itens_checklists, :tipo_checklist_id, :integer
  end
end
