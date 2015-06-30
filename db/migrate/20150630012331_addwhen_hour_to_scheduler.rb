class AddwhenHourToScheduler < ActiveRecord::Migration
  def change
    add_column :schedulers, :whenHour, :integer
  end
end
