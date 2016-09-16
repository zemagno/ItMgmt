class ProducaosController < InheritedResources::Base

  def index2
    @producaos = Producao.paginate(:page => params[:page])

  end


  def index

    @search = params[:search] || session[:search_producaos]
    session[:search_producaos] = @search
     	puts "0"
    
    begin
      if @search.blank?
      	puts "1"
        @producaos = Producao.paginate(:page => params[:page])
      else
      	 	puts "2"
        puts @search
        @producaos = Producao.search @search, :match_mode => :boolean, :per_page => 20, :page => params[:page]
        puts "2.1"
        @producaos.length #TODO rever essa linha
        puts "2.1"
        @producaos.compact!
      end
    rescue  => error
    	 	puts "3"
    
      error.backtrace
      flash[:error] = "Error[DB0001] - Erro no mecanismo de busca. Listando tudo !"
      @producaos = Producao.paginate(:page => params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @producaos }
    end


  end
end
