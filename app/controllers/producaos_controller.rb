class ProducaosController < InheritedResources::Base

	def index
		@producaos = Producao.paginate(:page => params[:page])
		
	end
end

