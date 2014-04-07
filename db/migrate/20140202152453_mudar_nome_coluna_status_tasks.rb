class MudarNomeColunaStatusTasks < ActiveRecord::Migration
  def change	
     rename_column :tasks, :status_id, :status_incidente_id
  end
end
