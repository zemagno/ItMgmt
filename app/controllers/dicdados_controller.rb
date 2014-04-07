class DicdadosController < ApplicationController
  # GET /dicdados
  # GET /dicdados.xml
  authorize_resource
  

  def carrega_agregadas
    @tipocis = Tipoci.all
  end

  def index

    @search = params[:search] || session[:search_dicdados]
    session[:search_dicdados] = @search

    
    begin
      @dicdados = Dicdado.search @search, :match_mode => :boolean, :per_page => 15 , :page => params[:page], :sort_mode => :extended, :order => "tipoci_id ASC, ordem ASC"
      @dicdados.compact!
    rescue 
      flash[:error] = "Error[DB0001] - Search Engine desligado ou com problema"
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

  # POST /dicdados
  # POST /dicdados.xml
  def create
    @dicdado = Dicdado.new(params[:dicdado])

    respond_to do |format|
      if @dicdado.save
        format.html { redirect_to(@dicdado, :notice => 'Dicdado was successfully created.') }
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

    respond_to do |format|
      if @dicdado.update_attributes(params[:dicdado])
        format.html { redirect_to(@dicdado, :notice => 'Dicdado was successfully updated.') }
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
      puts "Atributo existe"
    else
      puts "Atributo nao existe"
      @dicdado = Dicdado.find(params[:id])
      @dicdado.destroy
    end
    respond_to do |format|
      format.html { redirect_to(dicdados_url) }
      format.xml  { head :ok }
    end
  end
end
