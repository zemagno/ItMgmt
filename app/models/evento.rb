class Evento < ActiveRecord::Base
	has_many :checklists
end
