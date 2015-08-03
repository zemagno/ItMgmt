class AddProcessadoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :processado, :boolean
    execute %Q{ update events set processado=1; }
  end
end
