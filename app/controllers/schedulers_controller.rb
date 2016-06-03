class SchedulersController < InheritedResources::Base

	load_and_authorize_resource

def run
	id = params[:id]
	job = Scheduler.find(id)
	Producao.dispatcherJob(job.job)
	flash[:info] = "INFO: Job [#{job.job}] enfileirado para execucao"
	@schedulers = Scheduler.all
	redirect_to :controller => 'schedulers', :action => 'index'
end
end

