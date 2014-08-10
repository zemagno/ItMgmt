class CadrelatoriosController < ApplicationController
  
  authorize_resource

  helper_method :categoria_relatorios

  def categoria_relatorios
    # TODO - transferir a logica do Model para o model e deixar uma chamada generica, ja devolvendo o array
    Parametro.find_by_tipo_and_subtipo("relatorios","categorias").valor.split
  #testar isso..colocar combo no forma
  #colocar pesquisa sphinx
  #colocar will paginate
  end
  
  def index
    @cadrelatorios = Cadrelatorio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadrelatorios }
    end
  end

  # GET /cadrelatorios/1
  # GET /cadrelatorios/1.json
  def show
    @cadrelatorio = Cadrelatorio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cadrelatorio }
    end
  end

  # GET /cadrelatorios/new
  # GET /cadrelatorios/new.json
  def new
    @cadrelatorio = Cadrelatorio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cadrelatorio }
    end
  end

  # GET /cadrelatorios/1/edit
  def edit
    @cadrelatorio = Cadrelatorio.find(params[:id])
  end

  # POST /cadrelatorios
  # POST /cadrelatorios.json
  def create
    @cadrelatorio = Cadrelatorio.new(params[:cadrelatorio])

    respond_to do |format|
      if @cadrelatorio.save
        format.html { redirect_to @cadrelatorio, notice: 'Cadrelatorio was successfully created.' }
        format.json { render json: @cadrelatorio, status: :created, location: @cadrelatorio }
      else
        format.html { render action: "new" }
        format.json { render json: @cadrelatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cadrelatorios/1
  # PUT /cadrelatorios/1.json
  def update
    @cadrelatorio = Cadrelatorio.find(params[:id])

    respond_to do |format|
      if @cadrelatorio.update_attributes(params[:cadrelatorio])
        format.html { redirect_to @cadrelatorio, notice: 'Cadrelatorio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cadrelatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cadrelatorios/1
  # DELETE /cadrelatorios/1.json
  def destroy
    @cadrelatorio = Cadrelatorio.find(params[:id])
    @cadrelatorio.destroy

    respond_to do |format|
      format.html { redirect_to cadrelatorios_url }
      format.json { head :no_content }
    end
  end
end
