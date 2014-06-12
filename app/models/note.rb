class Note < ActiveRecord::Base
	attr_accessible :notes


	define_index do
	   indexes :notes
	end

end
