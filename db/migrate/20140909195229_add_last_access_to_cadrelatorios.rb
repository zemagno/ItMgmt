class AddLastAccessToCadrelatorios < ActiveRecord::Migration
  def change
    add_column :cadrelatorios, :ultimoacesso, :date
  end
end
