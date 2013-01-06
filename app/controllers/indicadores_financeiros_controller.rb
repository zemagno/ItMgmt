class IndicadoresFinanceirosController < ApplicationController
  # GET /indicadores_financeiros
  # GET /indicadores_financeiros.xml
  def index
    @indicadores_financeiros = IndicadorFinanceiro.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @indicadores_financeiros }
    end
  end

  # GET /indicadores_financeiros/1
  # GET /indicadores_financeiros/1.xml
  def show
    @indicadores_financeiros = IndicadorFinanceiro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @indicadores_financeiro }
    end
  end

  # GET /indicadores_financeiros/new
  # GET /indicadores_financeiros/new.xml
  def new
    @indicadores_financeiros = IndicadorFinanceiro.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @indicadores_financeiros }
    end
  end

  # GET /indicadores_financeiros/1/edit
  def edit
    @indicadores_financeiros = IndicadorFinanceiro.find(params[:id])
  end

  # POST /indicadores_financeiros
  # POST /indicadores_financeiros.xml
  def create
    @indicadores_financeiros = IndicadorFinanceiro.new(params[:indicador_financeiro])
    

    respond_to do |format|
      if @indicadores_financeiros.save
        format.html { redirect_to(@indicadores_financeiros, :notice => 'Indicador financeiro was successfully created.') }
        format.xml  { render :xml => @indicadores_financeiros, :status => :created, :location => @indicadores_financeiros }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @indicadores_financeiros.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /indicadores_financeiros/1
  # PUT /indicadores_financeiros/1.xml
  def update
    @indicadores_financeiros = IndicadorFinanceiro.find(params[:id])

    respond_to do |format|
      if @indicadores_financeiros.update_attributes(params[:indicador_financeiro])
        format.html { redirect_to(@indicadores_financeiros, :notice => 'Indicador financeiro was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @indicadores_financeiros.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /indicadores_financeiros/1
  # DELETE /indicadores_financeiros/1.xml
  def destroy
    @indicadores_financeiros = IndicadorFinanceiro.find(params[:id])
    @indicadores_financeiros.destroy

    respond_to do |format|
      format.html { redirect_to(indicadores_financeiros_url) }
      format.xml  { head :ok }
    end
  end
end
