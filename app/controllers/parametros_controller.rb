class ParametrosController < ApplicationController
  # GET /parametros
  # GET /parametros.xml
    before_filter :authenticate_user!
  authorize_resource
  def index
    @parametros = Parametro.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parametros }
    end
  end

  # GET /parametros/1
  # GET /parametros/1.xml
  def show
    @parametro = Parametro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @parametro }
    end
  end

  def duplicar
    begin
      parametro_orig = Parametro.find(params[:id])
      @parametro = parametro_orig.deep_clone
      @parametro.subtipo = ""
      respond_to do |format|
        format.html { render :action => 'new' }
      end
    rescue Exception => error
      puts error
      puts error.backtrace
      flash[:error] = "Error[PA0001] - Parametro #{[params[:id]]} Invalido"
      redirect_to "/parametros" and return
    end
  end

  # GET /parametros/new
  # GET /parametros/new.xml
  def new
    @parametro = Parametro.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @parametro }
    end
  end

  # GET /parametros/1/edit
  def edit
    begin
      @parametro = Parametro.find(params[:id])
    rescue

      flash[:error] = "Error[PA0001] - Parametro #{[params[:id]]} Invalido"
      redirect_to "/parametros" and return
    end
  end

  # POST /parametros
  # POST /parametros.xml
  def create
    @parametro = Parametro.new(params[:parametro])

    respond_to do |format|
      if @parametro.save
        format.html { redirect_to @parametro, notice: 'Parametro foi criado com sucesso !' }
        format.xml  { render :xml => @parametro, :status => :created, :location => @parametro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @parametro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parametros/1
  # PUT /parametros/1.xml
  def update
    @parametro = Parametro.find(params[:id])

    respond_to do |format|
      if @parametro.update_attributes(params[:parametro])
        format.html { redirect_to @parametro, :notice => 'Parametro foi atualizado com sucesso !' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @parametro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parametros/1
  # DELETE /parametros/1.xml
  def destroy
    @parametro = Parametro.find(params[:id])
    @parametro.destroy

    respond_to do |format|
      format.html { redirect_to(parametros_url) }
      format.xml  { head :ok }
    end
  end
end
