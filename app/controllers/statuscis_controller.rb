class StatuscisController < ApplicationController
  # GET /statuscis
  # GET /statuscis.json
  authorize_resource 
  def index
    @statuscis = Statusci.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuscis }
      
    end
  end

  # GET /statuscis/1
  # GET /statuscis/1.json
  def show
    @statusci = Statusci.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @statusci }
    end
  end

  # GET /statuscis/new
  # GET /statuscis/new.json
  def new
    @statusci = Statusci.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statusci }
    end
  end

  # GET /statuscis/1/edit
  def edit
    @statusci = Statusci.find(params[:id])
  end

  # POST /statuscis
  # POST /statuscis.json
  def create
    @statusci = Statusci.new(params[:statusci])

    respond_to do |format|
      if @statusci.save
        format.html { redirect_to @statusci, notice: 'Statusci was successfully created.' }
        format.json { render json: @statusci, status: :created, location: @statusci }
      else
        format.html { render action: "new" }
        format.json { render json: @statusci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statuscis/1
  # PUT /statuscis/1.json
  def update
    @statusci = Statusci.find(params[:id])

    respond_to do |format|
      if @statusci.update_attributes(params[:statusci])
        format.html { redirect_to @statusci, notice: 'Statusci was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @statusci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuscis/1
  # DELETE /statuscis/1.json
  def destroy
    @statusci = Statusci.find(params[:id])
    @statusci.destroy

    respond_to do |format|
      format.html { redirect_to statuscis_url }
      format.json { head :no_content }
    end
  end
end
