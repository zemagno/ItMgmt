class Pedido < ActiveRecord::Base
  belongs_to :site
  belongs_to :status_pedido
  
  LOGIN_MIN_LENGTH = 4
  LOGIN_MAX_LENGTH = 15
  LOGIN_SCREEN_SIZE = 15
  
end
