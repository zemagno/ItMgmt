class ProducaosController < InheritedResources::Base
  before_filter :authenticate_user!
  def index2
    @producaos = Producao.paginate(:page => params[:page])

  end


  def index

    @search = params[:search] || session[:search_producaos]
    session[:search_producaos] = @search

    
    begin
      if @search.blank?
        @producaos = Producao.paginate(:page => params[:page])
      else
        @producaos = Producao.search @search, :match_mode => :boolean, :per_page => 20, :page => params[:page]
        @producaos.compact!
      end
    rescue  => error
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
