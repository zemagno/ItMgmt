class Snippet < ActiveRecord::Base
  attr_accessible :highlighted_code, :language, :plain_code
end
