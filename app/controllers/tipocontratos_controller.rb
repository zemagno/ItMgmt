class TipocontratosController < ApplicationController
  # GET /tipocontratos
  # GET /tipocontratos.xml
  def index
    @tipocontratos = Tipocontrato.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipocontratos }
    end
  end

  # GET /tipocontratos/1
  # GET /tipocontratos/1.xml
  def show
    @tipocontrato = Tipocontrato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipocontrato }
    end
  end

  # GET /tipocontratos/new
  # GET /tipocontratos/new.xml
  def new
    @tipocontrato = Tipocontrato.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipocontrato }
    end
  end

  # GET /tipocontratos/1/edit
  def edit
    @tipocontrato = Tipocontrato.find(params[:id])
  end

  # POST /tipocontratos
  # POST /tipocontratos.xml
  def create
    @tipocontrato = Tipocontrato.new(params[:tipocontrato])

    respond_to do |format|
      if @tipocontrato.save
        format.html { redirect_to(@tipocontrato, :notice => 'Tipocontrato was successfully created.') }
        format.xml  { render :xml => @tipocontrato, :status => :created, :location => @tipocontrato }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipocontrato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipocontratos/1
  # PUT /tipocontratos/1.xml
  def update
    @tipocontrato = Tipocontrato.find(params[:id])

    respond_to do |format|
      if @tipocontrato.update_attributes(params[:tipocontrato])
        format.html { redirect_to(@tipocontrato, :notice => 'Tipocontrato was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipocontrato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipocontratos/1
  # DELETE /tipocontratos/1.xml
  def destroy
    @tipocontrato = Tipocontrato.find(params[:id])
    @tipocontrato.destroy

    respond_to do |format|
      format.html { redirect_to(tipocontratos_url) }
      format.xml  { head :ok }
    end
  end
end
