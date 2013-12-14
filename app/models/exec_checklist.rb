class ExecChecklist < ActiveRecord::Base
  belongs_to :tipoci
  attr_accessible :cis, :descricao, :fimexec, :gmud, :inicioexec, :users
end
