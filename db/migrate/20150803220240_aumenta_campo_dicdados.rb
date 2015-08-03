class AumentaCampoDicdados < ActiveRecord::Migration
  def change
  	execute %Q{ ALTER TABLE dicdados MODIFY COLUMN valores varchar(1000); }
  end
end
