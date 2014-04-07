class ExecChecklist < ActiveRecord::Base
  belongs_to :tipoci
  has_many :exec_itens_checklist
  attr_accessible :cis, :descricao, :fimexec, :inicioexec, :users
end
