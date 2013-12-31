class ItensChecklist < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :tipo_checklist

  attr_accessible :cis, :descricao, :users, :checklist_id, :tipo_checklist_id, :TipoAberturaTicket
end
