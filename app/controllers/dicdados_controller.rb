class DicdadosController < ApplicationController
  # GET /dicdados
  # GET /dicdados.xml
  authorize_resource
  

  def carrega_agregadas
    @tipocis = Tipoci.all
    @tabs = @tipocis.map { |x| [x.id,x.tipo,x.tab] }
  end

  def index

    @search = params[:search] || session[:search_dicdados]
    session[:search_dicdados] = @search

    
    begin
      @dicdados = Dicdado.search @search, :match_mode => :boolean, :per_page => 15 , :page => params[:page], :sort_mode => :extended , :order => "sort_tipoci_id ASC, sort_ordem ASC"
      @dicdados.compact!
    rescue 
      flash[:error] = "Error[DB0001] - Search Engine com Problema"
      @dicdados = Dicdado.paginate(:page => params[:page])
    end

    
    session[:search_dicdados_tipoci] = @dicdados[0].tipoci_id unless @dicdados[0].nil?

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dicdados }
    end
  end

  # GET /dicdados/1
  # GET /dicdados/1.xml
  def show
    @dicdado = Dicdado.find(params[:id])
    carrega_agregadas

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dicdado }
    end
  end

  # GET /dicdados/new
  # GET /dicdados/new.xml
  def new
    @dicdado = Dicdado.new
    @dicdado.tipoci_id = session[:search_dicdados_tipoci] unless session[:search_dicdados_tipoci].nil?
    carrega_agregadas


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dicdado }
    end
  end

  # GET /dicdados/1/edit
  def edit
    @dicdado = Dicdado.find(params[:id])
    carrega_agregadas
  end


  def duplicar
    begin
      dicdado_orig = Dicdado.find(params[:id])
      @dicdado = dicdado_orig.deep_clone
      carrega_agregadas
      respond_to do |format|
        format.html { render :action => 'new' }
      end
    rescue Exception => error
      puts error
      puts error.backtrace
      flash[:error] = "Error[DD0001] - Dicionario de ativos #{[params[:id]]} Invalido"
      redirect_to "/dicdados" and return
    end
  end

  # POST /dicdados
  # POST /dicdados.xml
  def create
    @dicdado = Dicdado.new(params[:dicdado])
    carrega_agregadas

    respond_to do |format|
      if @dicdado.save
        format.html { redirect_to(@dicdado, :notice => 'Campo foi criado com sucesso !') }
        format.xml  { render :xml => @dicdado, :status => :created, :location => @dicdado }
      else
        carrega_agregadas
        format.html { render :action => "new" }
        format.xml  { render :xml => @dicdado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dicdados/1
  # PUT /dicdados/1.xml
  def update
    @dicdado = Dicdado.find(params[:id])
    carrega_agregadas

    respond_to do |format|
      if @dicdado.update_attributes(params[:dicdado])
        format.html { redirect_to(@dicdado, :notice => 'Campo foi atualizado com sucesso !') }
        format.xml  { head :ok }
      else
        carrega_agregadas
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dicdado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dicdados/1
  # DELETE /dicdados/1.xml
  def destroy
    if Atributo.esta_em_uso?(params[:id]) then
      flash[:error] = "Nao eh possivel apagar esse Campo. Existem atributos de CI com valores"

    else
      @dicdado = Dicdado.find(params[:id])
      @dicdado.destroy
    end
    respond_to do |format|
      format.html { redirect_to(dicdados_url) }
      format.xml  { head :ok }
    end
  end
end
