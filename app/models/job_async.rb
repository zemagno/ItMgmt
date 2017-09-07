class JobAsync < ActiveRecord::Base
	enum status: [ :pending, :executed, :error ]
end