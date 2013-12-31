class AddTicketsToExecChecklists < ActiveRecord::Migration
  def change
    add_column :exec_checklists, :tickets, :string
  end
end
