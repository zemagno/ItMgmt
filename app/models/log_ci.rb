class LogCi < ActiveRecord::Base
  attr_accessible :userid, :data, :historico, :ci_id

  belongs_to :ci

end
