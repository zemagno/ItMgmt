class StatusChamadosController < ApplicationController
  # GET /status_chamados
  # GET /status_chamados.xml
  def index
    @status_chamados = StatusChamado.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @status_chamados }
    end
  end

  # GET /status_chamados/1
  # GET /status_chamados/1.xml
  def show
    @status_chamado = StatusChamado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @status_chamado }
    end
  end

  # GET /status_chamados/new
  # GET /status_chamados/new.xml
  def new
    @status_chamado = StatusChamado.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @status_chamado }
    end
  end

  # GET /status_chamados/1/edit
  def edit
    @status_chamado = StatusChamado.find(params[:id])
  end

  # POST /status_chamados
  # POST /status_chamados.xml
  def create
    @status_chamado = StatusChamado.new(params[:status_chamado])

    respond_to do |format|
      if @status_chamado.save
        format.html { redirect_to(@status_chamado, :notice => 'Status chamado was successfully created.') }
        format.xml  { render :xml => @status_chamado, :status => :created, :location => @status_chamado }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @status_chamado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /status_chamados/1
  # PUT /status_chamados/1.xml
  def update
    @status_chamado = StatusChamado.find(params[:id])

    respond_to do |format|
      if @status_chamado.update_attributes(params[:status_chamado])
        format.html { redirect_to(@status_chamado, :notice => 'Status chamado was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @status_chamado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /status_chamados/1
  # DELETE /status_chamados/1.xml
  def destroy
    @status_chamado = StatusChamado.find(params[:id])
    @status_chamado.destroy

    respond_to do |format|
      format.html { redirect_to(status_chamados_url) }
      format.xml  { head :ok }
    end
  end
end
