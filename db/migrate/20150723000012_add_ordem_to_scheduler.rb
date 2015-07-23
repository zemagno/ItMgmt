class AddOrdemToScheduler < ActiveRecord::Migration
  def change
    add_column :schedulers, :ordem, :string
  end
end
