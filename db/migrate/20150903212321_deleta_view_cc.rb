class DeletaViewCc < ActiveRecord::Migration
  def change
      execute %Q{ DROP VIEW CC ; }
  end
end
