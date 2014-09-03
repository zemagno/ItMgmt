class ExecChecklist < ActiveRecord::Base
  has_many :exec_itens_checklist
  belongs_to :status_checklist
  belongs_to :checklist
  attr_accessible :cis, :descricao, :fimexec, :inicioexec, :users


  def status
  	(status_checklist.status unless status_checklist_id.nil? ) || "Indef"
  end
end
