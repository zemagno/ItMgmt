class TipoChamadosController < ApplicationController
  # GET /tipo_chamados
  # GET /tipo_chamados.xml
  def index
    @tipo_chamados = TipoChamado.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_chamados }
    end
  end

  # GET /tipo_chamados/1
  # GET /tipo_chamados/1.xml
  def show
    @tipo_chamado = TipoChamado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_chamado }
    end
  end

  # GET /tipo_chamados/new
  # GET /tipo_chamados/new.xml
  def new
    @tipo_chamado = TipoChamado.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_chamado }
    end
  end

  # GET /tipo_chamados/1/edit
  def edit
    @tipo_chamado = TipoChamado.find(params[:id])
  end

  # POST /tipo_chamados
  # POST /tipo_chamados.xml
  def create
    @tipo_chamado = TipoChamado.new(params[:tipo_chamado])

    respond_to do |format|
      if @tipo_chamado.save
        format.html { redirect_to(@tipo_chamado, :notice => 'Tipo chamado was successfully created.') }
        format.xml  { render :xml => @tipo_chamado, :status => :created, :location => @tipo_chamado }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_chamado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_chamados/1
  # PUT /tipo_chamados/1.xml
  def update
    @tipo_chamado = TipoChamado.find(params[:id])

    respond_to do |format|
      if @tipo_chamado.update_attributes(params[:tipo_chamado])
        format.html { redirect_to(@tipo_chamado, :notice => 'Tipo chamado was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_chamado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_chamados/1
  # DELETE /tipo_chamados/1.xml
  def destroy
    @tipo_chamado = TipoChamado.find(params[:id])
    @tipo_chamado.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_chamados_url) }
      format.xml  { head :ok }
    end
  end
end
