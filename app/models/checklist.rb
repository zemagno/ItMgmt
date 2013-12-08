class Checklist < ActiveRecord::Base
  belongs_to :tipoci
  attr_accessible :descricao, :user, :tipoci_id
end
