class AlteraUrlcis < ActiveRecord::Migration
  def up
  	execute %Q{ ALTER TABLE cis MODIFY COLUMN url mediumtext; }
  end

  def down
  end
end
