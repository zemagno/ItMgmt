class CriticidadesController < ApplicationController
  # GET /criticidades
  # GET /criticidades.xml
  authorize_resource 
  def index
    @criticidades = Criticidade.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @criticidades }
    end
  end

  # GET /criticidades/1
  # GET /criticidades/1.xml
  def show
    @criticidade = Criticidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @criticidade }
    end
  end

  # GET /criticidades/new
  # GET /criticidades/new.xml
  def new
    @criticidade = Criticidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @criticidade }
    end
  end

  # GET /criticidades/1/edit
  def edit
    @criticidade = Criticidade.find(params[:id])
  end

  # POST /criticidades
  # POST /criticidades.xml
  def create
    @criticidade = Criticidade.new(params[:criticidade])

    respond_to do |format|
      if @criticidade.save
        format.html { redirect_to(@criticidade, :notice => 'Criticidade foi criado com sucesso !') }
        format.xml  { render :xml => @criticidade, :status => :created, :location => @criticidade }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @criticidade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /criticidades/1
  # PUT /criticidades/1.xml
  def update
    @criticidade = Criticidade.find(params[:id])

    respond_to do |format|
      if @criticidade.update_attributes(params[:criticidade])
        format.html { redirect_to(@criticidade, :notice => 'Criticidade foi atualizado com sucesso !.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @criticidade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /criticidades/1
  # DELETE /criticidades/1.xml
  def destroy
    @criticidade = Criticidade.find(params[:id])
    @criticidade.destroy

    respond_to do |format|
      format.html { redirect_to(criticidades_url) }
      format.xml  { head :ok }
    end
  end
end
