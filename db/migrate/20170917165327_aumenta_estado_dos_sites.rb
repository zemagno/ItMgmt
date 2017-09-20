class AumentaEstadoDosSites < ActiveRecord::Migration
  def change
	execute %Q{ ALTER TABLE sites MODIFY COLUMN estado varchar(10); }
  end
end
