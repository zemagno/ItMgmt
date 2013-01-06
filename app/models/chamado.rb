class Chamado < ActiveRecord::Base
  belongs_to :SubTipoChamado
  belongs_to :StatusChamado
end
