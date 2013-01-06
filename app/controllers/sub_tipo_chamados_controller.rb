class SubTipoChamadosController < ApplicationController
  # GET /sub_tipo_chamados
  # GET /sub_tipo_chamados.xml
  def index
    @sub_tipo_chamados = SubTipoChamado.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_tipo_chamados }
    end
  end

  # GET /sub_tipo_chamados/1
  # GET /sub_tipo_chamados/1.xml
  def show
    @sub_tipo_chamado = SubTipoChamado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sub_tipo_chamado }
    end
  end

  # GET /sub_tipo_chamados/new
  # GET /sub_tipo_chamados/new.xml
  def new
    @sub_tipo_chamado = SubTipoChamado.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sub_tipo_chamado }
    end
  end

  # GET /sub_tipo_chamados/1/edit
  def edit
    @sub_tipo_chamado = SubTipoChamado.find(params[:id])
  end

  # POST /sub_tipo_chamados
  # POST /sub_tipo_chamados.xml
  def create
    @sub_tipo_chamado = SubTipoChamado.new(params[:sub_tipo_chamado])

    respond_to do |format|
      if @sub_tipo_chamado.save
        format.html { redirect_to(@sub_tipo_chamado, :notice => 'Sub tipo chamado was successfully created.') }
        format.xml  { render :xml => @sub_tipo_chamado, :status => :created, :location => @sub_tipo_chamado }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sub_tipo_chamado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sub_tipo_chamados/1
  # PUT /sub_tipo_chamados/1.xml
  def update
    @sub_tipo_chamado = SubTipoChamado.find(params[:id])

    respond_to do |format|
      if @sub_tipo_chamado.update_attributes(params[:sub_tipo_chamado])
        format.html { redirect_to(@sub_tipo_chamado, :notice => 'Sub tipo chamado was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sub_tipo_chamado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_tipo_chamados/1
  # DELETE /sub_tipo_chamados/1.xml
  def destroy
    @sub_tipo_chamado = SubTipoChamado.find(params[:id])
    @sub_tipo_chamado.destroy

    respond_to do |format|
      format.html { redirect_to(sub_tipo_chamados_url) }
      format.xml  { head :ok }
    end
  end
end
