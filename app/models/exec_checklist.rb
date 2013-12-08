class ExecChecklist < ActiveRecord::Base
  belongs_to :ci
  belongs_to :tipoci
  attr_accessible :descricao, :fimexec, :gmud, :inicioexec, :user
end
