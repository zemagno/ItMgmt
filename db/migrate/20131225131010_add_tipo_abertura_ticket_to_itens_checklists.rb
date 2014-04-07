class AddTipoAberturaTicketToItensChecklists < ActiveRecord::Migration
  def change
    add_column :itens_checklists, :TipoAberturaTicket, :string, :limit => 20
  end
end
