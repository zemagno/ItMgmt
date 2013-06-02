class ContratosController < ApplicationController
  # GET /contratos
  # GET /contratos.xml
  #  layout 'application_novolyaout' 
  authorize_resource 
  def index
    @search = params[:search] || session[:search_contratos]
    session[:search_contratos] = @search

    begin
      @contratos = Contrato.search params[:search], :match_mode => :boolean, :per_page => 15 , :page => params[:page]
      @contratos.compact!
    rescue 
      flash[:error] = "Error[DB0001] - Search Engine desligado"
      @contratos = Contrato.paginate(:page => params[:page])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contratos }
    end
  end

  def todos
    @contratos = Contrato.paginate(:per_page => 100000, :page => 1)
    respond_to do |format|
      format.html { render :index }
      format.xml  { render :xml => @contratos }
    end
  end

  # GET /contratos/1
  # GET /contratos/1.xml
  def show
    @contrato = Contrato.find_gen(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contrato }
    end
  end

  # GET /contratos/new
  # GET /contratos/new.xml
  def new
    @contrato = Contrato.new
    @tiposcontrato = Tipocontrato.all
    @fornecedores = Fornecedor.all
    @IndicadoresFinanceiros = IndicadorFinanceiro.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contrato }
    end
  end

  # GET /contratos/1/edit
  def edit
    @contrato = Contrato.find(params[:id])
    @tiposcontrato = Tipocontrato.all
    @fornecedores = Fornecedor.all
    @IndicadoresFinanceiros = IndicadorFinanceiro.all
  end

  # POST /contratos
  # POST /contratos.xml
  def create
    @contrato = Contrato.new(params[:contrato])

    respond_to do |format|
      if @contrato.save
        format.html { redirect_to(@contrato, :notice => 'Contrato was successfully created.') }
        format.xml  { render :xml => @contrato, :status => :created, :location => @contrato }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contrato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contratos/1
  # PUT /contratos/1.xml
  def update
    @contrato = Contrato.find(params[:id])

    respond_to do |format|
      if @contrato.update_attributes(params[:contrato])
        format.html { redirect_to(@contrato, :notice => 'Contrato was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contrato.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def email_cobranca
    
  end

  # DELETE /contratos/1
  # DELETE /contratos/1.xml
  def destroy
    @contrato = Contrato.find(params[:id])
    @contrato.destroy

    respond_to do |format|
      format.html { redirect_to(contratos_url) }
      format.xml  { head :ok }
    end
  end
end
