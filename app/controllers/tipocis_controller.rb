class TipocisController < ApplicationController
  # GET /tipocis
  # GET /tipocis.json
  authorize_resource 
  def index
    @tipocis = Tipoci.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @tipocis }
      format.json { render json: @tipocis }
    end
  end

  # GET /tipocis/1
  # GET /tipocis/1.json
  def show
    @tipoci = Tipoci.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipoci }
    end
  end

  # GET /tipocis/new
  # GET /tipocis/new.json
  def new
    @tipoci = Tipoci.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipoci }
    end
  end

  # GET /tipocis/1/edit
  def edit
    @tipoci = Tipoci.find(params[:id])
  end

  # POST /tipocis
  # POST /tipocis.json
  def create
    @tipoci = Tipoci.new(params[:tipoci])

    respond_to do |format|
      if @tipoci.save
        format.html { redirect_to @tipoci, notice: 'Tipo foi criado com sucesso !' }
        format.json { render json: @tipoci, status: :created, location: @tipoci }
      else
        format.html { render action: "new" }
        format.json { render json: @tipoci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipocis/1
  # PUT /tipocis/1.json
  def update
    @tipoci = Tipoci.find(params[:id])

    respond_to do |format|
      if @tipoci.update_attributes(params[:tipoci])
        format.html { redirect_to @tipoci, notice: 'Tipo foi atualizado com sucesso !' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipoci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipocis/1
  # DELETE /tipocis/1.json
  def destroy
    if Tipoci.esta_em_uso?(params[:id])
      flash[:error] = I18n.t("errors.tipoci.tipo_em_uso") #{}"Nao é possivel apagar esse Campo. Existem atributos de Ativos com esse campo"
    else
      @tipoci = Tipoci.find(params[:id])
      @tipoci.destroy
    end

    respond_to do |format|
      format.html { redirect_to tipocis_url,  notice: 'Tipo foi excluido com sucesso !' }
      format.json { head :no_content }
    end
  end
end

