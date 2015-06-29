class SchedulersController < InheritedResources::Base

def run
	id = params[:id]
	job = Scheduler.find(id)
	Producao.dispatcherJob(job.job)
	flash[:info] = "INFO: Job [#{job.job}] enfileirado para execucao"
	@schedulers = Scheduler.all
	render :index and return
end
end

