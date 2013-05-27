class AreafornecedoresController < ApplicationController
  # GET /areafornecedores
  # GET /areafornecedores.xml
  authorize_resource 
  
  def index
    @areafornecedores = Areafornecedor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @areafornecedores }
    end
  end

  # GET /areafornecedores/1
  # GET /areafornecedores/1.xml
  def show
    @areafornecedores = Areafornecedor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @areafornecedores }
    end
  end

  # GET /areafornecedores/new
  # GET /areafornecedores/new.xml
  def new
    @areafornecedores = Areafornecedor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @areafornecedores }
    end
  end

  # GET /areafornecedores/1/edit
  def edit
    @areafornecedores = Areafornecedor.find(params[:id])
  end

  # POST /areafornecedores
  # POST /areafornecedores.xml
  def create
    @areafornecedores = Areafornecedor.new(params[:areafornecedor])

    respond_to do |format|
      if @areafornecedores.save
        format.html { redirect_to(@areafornecedores, :notice => 'Area de Fornecedor criada com sucesso.') }
        format.xml  { render :xml => @areafornecedores, :status => :created, :location => @areafornecedores }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @areafornecedores.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /areafornecedores/1
  # PUT /areafornecedores/1.xml
  def update
    @areafornecedores = Areafornecedor.find(params[:id])

    respond_to do |format|
      if @areafornecedores.update_attributes(params[:areafornecedor])
        format.html { redirect_to(@areafornecedores, :notice => 'Area de Fornecedor atualizada com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @areafornecedores.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /areafornecedores/1
  # DELETE /areafornecedores/1.xml
  def destroy
    @areafornecedores = Areafornecedor.find(params[:id])
    @areafornecedores.destroy

    respond_to do |format|
      format.html { redirect_to(areafornecedores_url) }
      format.xml  { head :ok }
    end
  end
end
