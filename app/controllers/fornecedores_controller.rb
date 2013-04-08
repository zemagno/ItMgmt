class FornecedoresController < ApplicationController
  # GET /fornecedores
  # GET /fornecedores.xml
  layout 'application_novolyaout' 
  def index
    @fornecedores = Fornecedor.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fornecedores }
    end
  end

  # GET /fornecedores/1
  # GET /fornecedores/1.xml
  def show
    @fornecedor = Fornecedor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fornecedor }
    end
  end

  def todos
    @fornecedores = Fornecedor.paginate(:per_page => 100000, :page => 1)
    respond_to do |format|
      format.html { render :index }
      format.xml  { render :xml => @fornecedores }
    end
  end


  # GET /fornecedores/new
  # GET /fornecedores/new.xml
  def new
    @fornecedor = Fornecedor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fornecedor }
    end
  end

  # GET /fornecedores/1/edit
  def edit
    @fornecedor = Fornecedor.find(params[:id])
  end

  # POST /fornecedores
  # POST /fornecedores.xml
  def create
    @fornecedor = Fornecedor.new(params[:fornecedor])

    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to(@fornecedor, :notice => 'Fornecedor was successfully created.') }
        format.xml  { render :xml => @fornecedor, :status => :created, :location => @fornecedor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fornecedor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fornecedores/1
  # PUT /fornecedores/1.xml
  def update
    @fornecedor = Fornecedor.find(params[:id])

    respond_to do |format|
      if @fornecedor.update_attributes(params[:fornecedor])
        format.html { redirect_to(@fornecedor, :notice => 'Fornecedor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fornecedor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.xml
  def destroy
    @fornecedor = Fornecedor.find(params[:id])
    @fornecedor.destroy

    respond_to do |format|
      format.html { redirect_to(fornecedores_url) }
      format.xml  { head :ok }
    end
  end
end
