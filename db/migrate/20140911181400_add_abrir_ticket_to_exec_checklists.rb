class AddAbrirTicketToExecChecklists < ActiveRecord::Migration
  def change
    add_column :exec_checklists, :abrir_ticket, :boolean
  end
end
