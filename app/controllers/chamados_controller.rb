class ChamadosController < ApplicationController
  # GET /chamados
  # GET /chamados.xml
  def index
    @chamados = Chamado.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chamados }
    end
  end

  # GET /chamados/1
  # GET /chamados/1.xml
  def show
    @chamado = Chamado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chamado }
    end
  end

  # GET /chamados/new
  # GET /chamados/new.xml
  def new
    @chamado = Chamado.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chamado }
    end
  end

  # GET /chamados/1/edit
  def edit
    @chamado = Chamado.find(params[:id])
  end

  # POST /chamados
  # POST /chamados.xml
  def create
    @chamado = Chamado.new(params[:chamado])

    respond_to do |format|
      if @chamado.save
        format.html { redirect_to(@chamado, :notice => 'Chamado was successfully created.') }
        format.xml  { render :xml => @chamado, :status => :created, :location => @chamado }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chamado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chamados/1
  # PUT /chamados/1.xml
  def update
    @chamado = Chamado.find(params[:id])

    respond_to do |format|
      if @chamado.update_attributes(params[:chamado])
        format.html { redirect_to(@chamado, :notice => 'Chamado was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chamado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chamados/1
  # DELETE /chamados/1.xml
  def destroy
    @chamado = Chamado.find(params[:id])
    @chamado.destroy

    respond_to do |format|
      format.html { redirect_to(chamados_url) }
      format.xml  { head :ok }
    end
  end
end
