class Note < ActiveRecord::Base
  attr_accessible :notes

  after_save ThinkingSphinx::RealTime.callback_for(:note)

end
