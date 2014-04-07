class StatusIncidente < ActiveRecord::Base
  attr_accessible :ordem, :status, :tipo
end
