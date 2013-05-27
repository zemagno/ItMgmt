class NotificacaosController < ApplicationController
  # GET /notificacaos
  # GET /notificacaos.xml
  authorize_resource 
  def index
    @notificacaos = Notificacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notificacaos }
    end
  end

  # GET /notificacaos/1
  # GET /notificacaos/1.xml
  def show
    @notificacao = Notificacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @notificacao }
    end
  end

  # GET /notificacaos/new
  # GET /notificacaos/new.xml
  def new
    @notificacao = Notificacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @notificacao }
    end
  end

  # GET /notificacaos/1/edit
  def edit
    @notificacao = Notificacao.find(params[:id])
  end

  # POST /notificacaos
  # POST /notificacaos.xml
  def create
    @notificacao = Notificacao.new(params[:notificacao])

    respond_to do |format|
      if @notificacao.save
        format.html { redirect_to(@notificacao, :notice => 'Notificacao was successfully created.') }
        format.xml  { render :xml => @notificacao, :status => :created, :location => @notificacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notificacaos/1
  # PUT /notificacaos/1.xml
  def update
    @notificacao = Notificacao.find(params[:id])

    respond_to do |format|
      if @notificacao.update_attributes(params[:notificacao])
        format.html { redirect_to(@notificacao, :notice => 'Notificacao was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notificacaos/1
  # DELETE /notificacaos/1.xml
  def destroy
    @notificacao = Notificacao.find(params[:id])
    @notificacao.destroy

    respond_to do |format|
      format.html { redirect_to(notificacaos_url) }
      format.xml  { head :ok }
    end
  end
end
