class AddTicketsToExecItensChecklists < ActiveRecord::Migration
  def change
    add_column :exec_itens_checklists, :tickets, :string
  end
end
