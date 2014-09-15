class AddAbrirTicketToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :abrir_ticket, :boolean
  end
end
