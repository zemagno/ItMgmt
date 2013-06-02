class TipotasksController < ApplicationController
  # GET /tipotasks
  # GET /tipotasks.json
  def index
    @tipotasks = Tipotask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipotasks }
    end
  end

  # GET /tipotasks/1
  # GET /tipotasks/1.json
  def show
    @tipotask = Tipotask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipotask }
    end
  end

  # GET /tipotasks/new
  # GET /tipotasks/new.json
  def new
    @tipotask = Tipotask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipotask }
    end
  end

  # GET /tipotasks/1/edit
  def edit
    @tipotask = Tipotask.find(params[:id])
  end

  # POST /tipotasks
  # POST /tipotasks.json
  def create
    @tipotask = Tipotask.new(params[:tipotask])

    respond_to do |format|
      if @tipotask.save
        format.html { redirect_to @tipotask, notice: 'Tipotask was successfully created.' }
        format.json { render json: @tipotask, status: :created, location: @tipotask }
      else
        format.html { render action: "new" }
        format.json { render json: @tipotask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipotasks/1
  # PUT /tipotasks/1.json
  def update
    @tipotask = Tipotask.find(params[:id])

    respond_to do |format|
      if @tipotask.update_attributes(params[:tipotask])
        format.html { redirect_to @tipotask, notice: 'Tipotask was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipotask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipotasks/1
  # DELETE /tipotasks/1.json
  def destroy
    @tipotask = Tipotask.find(params[:id])
    @tipotask.destroy

    respond_to do |format|
      format.html { redirect_to tipotasks_url }
      format.json { head :no_content }
    end
  end
end
