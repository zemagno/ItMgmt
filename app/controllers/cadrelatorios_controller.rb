class CadrelatoriosController < ApplicationController

  authorize_resource

  before_filter :carrega_agregadas

  # helper_method :categoria_relatorios

  # def categoria_relatorios
  #   # TODO - transferir a logica do Model para o model e deixar uma chamada generica, ja devolvendo o array
  #   Parametro.get(:tipo => "relatorios", :subtipo => "categorias").split
  # #testar isso..colocar combo no forma
  # #colocar pesquisa sphinx
  # #colocar will paginate
  # end


  def carrega_agregadas
    @tiposci = Tipoci.all
  end

  def index

    @search = params[:search] || session[:search_relatorios]
    session[:search_relatorios] = @search
    begin
      if @search.blank?
        @cadrelatorios = Cadrelatorio.paginate(:page => params[:page])
      else
        @cadrelatorios = Cadrelatorio.search @search, :match_mode => :boolean, :per_page => 20, :page => params[:page]
        @cadrelatorios.length
        @cadrelatorios.compact!
      end
    rescue
      flash[:error] = "Error[DB0001] - Erro no mecanismo de busca. Listando tudo !"
      @cadrelatorios = Cadrelatorio.paginate(:page => params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadrelatorios }
    end


  end

  def duplicar
    begin
      cad = Cadrelatorio.find(params[:id])
      @newcad = cad.duplicar("Dup#{cad.nome}")
      # puts @newcad
      # puts @newcad.id
      respond_to do |format|
        format.html {redirect_to(:action => 'edit', :id => @newcad.id) }
      end
    rescue
      flash[:error] = "Error[CR0003] - Relatorio #{[params[:id]]} Invalido"
      redirect_to "/cadrelatorios" and return
    end

  end

  # GET /cadrelatorios/1
  # GET /cadrelatorios/1.json
  def show
    @cadrelatorio = Cadrelatorio.find_gen(params[:id])
    if @cadrelatorio.nil?
      flash[:error] = "Error[CR0001] - Relatorio #{[params[:id]]} Invalido"
      redirect_to "/cadrelatorios" and return
    end

    # carrega_agregadas
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cadrelatorio }
    end
  end

  # GET /cadrelatorios/new
  # GET /cadrelatorios/new.json
  def new
    # carrega_agregadas
    @cadrelatorio = Cadrelatorio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cadrelatorio }
    end
  end

  # GET /cadrelatorios/1/edit
  def edit

    begin
      @cadrelatorio = Cadrelatorio.find(params[:id])
      # carrega_agregadas
    rescue
      flash[:error] = "Error[CR0002] - Relatorio #{[params[:id]]} Invalido"
      redirect_to "/cadrelatorios" and return
    end
  end

  # POST /cadrelatorios
  # POST /cadrelatorios.json
  def create
    @cadrelatorio = Cadrelatorio.new(params[:cadrelatorio])

    respond_to do |format|
      if @cadrelatorio.save
        format.html { redirect_to @cadrelatorio, notice: 'Cadrelatorio was successfully created.' }
        format.json { render json: @cadrelatorio, status: :created, location: @cadrelatorio }
      else
        format.html { render action: "new" }
        format.json { render json: @cadrelatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cadrelatorios/1
  # PUT /cadrelatorios/1.json
  def update
    @cadrelatorio = Cadrelatorio.find(params[:id])

    respond_to do |format|
      if @cadrelatorio.update_attributes(params[:cadrelatorio])
        format.html { redirect_to @cadrelatorio, notice: 'Cadrelatorio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cadrelatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cadrelatorios/1
  # DELETE /cadrelatorios/1.json
  def destroy
    @cadrelatorio = Cadrelatorio.find(params[:id])
    @cadrelatorio.destroy

    respond_to do |format|
      format.html { redirect_to cadrelatorios_url }
      format.json { head :no_content }
    end
  end
end
