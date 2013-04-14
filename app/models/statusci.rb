class Statusci < ActiveRecord::Base
  attr_accessible :status

  belongs_to :ci
end
