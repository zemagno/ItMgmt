class TipocisController < ApplicationController
  # GET /tipocis
  # GET /tipocis.json
  def index
    @tipocis = Tipoci.all( :order => "tipo ASC")

    respond_to do |format|
      format.html # index.html.erb
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
        format.html { redirect_to @tipoci, notice: 'Tipoci was successfully created.' }
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
        format.html { redirect_to @tipoci, notice: 'Tipoci was successfully updated.' }
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
    @tipoci = Tipoci.find(params[:id])
    @tipoci.destroy

    respond_to do |format|
      format.html { redirect_to tipocis_url }
      format.json { head :no_content }
    end
  end
end
