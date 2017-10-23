class JobAsync < ActiveRecord::Base
	enum status: [ :pending, :executed, :error ]

	def self.add(_tipo,_action,_record_id,_params)
		job = JobAsync.new do |job|
			job.tipo = _tipo
			job.action = _action
			job.record_id = _record_id
			job.params = _params
			job.pending!
		end
		job.save!
		JobAsyncWorker.perform_in(1.minute,job.id)
	end

end