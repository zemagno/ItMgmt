class AddAreaResponsabilidadeToChecklist < ActiveRecord::Migration
  def change
    add_column :checklists, :area_responsabilidade_id, :integer
  end
end
