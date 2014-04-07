class AddstatusIdtotasks < ActiveRecord::Migration
  def change
    add_column :tasks, :status_id, :integer
    execute <<-SQL
        update tasks set status_id = (select id from status_incidentes where tasks.status = status_incidentes.status);
    SQL
  end
end
