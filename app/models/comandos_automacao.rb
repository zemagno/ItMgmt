class ComandosAutomacao < ActiveRecord::Base
  attr_accessible :comando, :parametro, :resultado, :status, :target
end
