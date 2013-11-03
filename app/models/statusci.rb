class Statusci < ActiveRecord::Base
  attr_accessible :status, :icon

  belongs_to :ci
end
