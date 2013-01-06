class StatusPedidosController < ApplicationController
  # GET /status_pedidos
  # GET /status_pedidos.xml
  def index
    @status_pedidos = StatusPedido.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @status_pedidos }
    end
  end

  # GET /status_pedidos/1
  # GET /status_pedidos/1.xml
  def show
    @status_pedido = StatusPedido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @status_pedido }
    end
  end

  # GET /status_pedidos/new
  # GET /status_pedidos/new.xml
  def new
    @status_pedido = StatusPedido.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @status_pedido }
    end
  end

  # GET /status_pedidos/1/edit
  def edit
    @status_pedido = StatusPedido.find(params[:id])
  end

  # POST /status_pedidos
  # POST /status_pedidos.xml
  def create
    @status_pedido = StatusPedido.new(params[:status_pedido])

    respond_to do |format|
      if @status_pedido.save
        format.html { redirect_to(@status_pedido, :notice => 'Status pedido was successfully created.') }
        format.xml  { render :xml => @status_pedido, :status => :created, :location => @status_pedido }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @status_pedido.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /status_pedidos/1
  # PUT /status_pedidos/1.xml
  def update
    @status_pedido = StatusPedido.find(params[:id])

    respond_to do |format|
      if @status_pedido.update_attributes(params[:status_pedido])
        format.html { redirect_to(@status_pedido, :notice => 'Status pedido was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @status_pedido.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /status_pedidos/1
  # DELETE /status_pedidos/1.xml
  def destroy
    @status_pedido = StatusPedido.find(params[:id])
    @status_pedido.destroy

    respond_to do |format|
      format.html { redirect_to(status_pedidos_url) }
      format.xml  { head :ok }
    end
  end
end
