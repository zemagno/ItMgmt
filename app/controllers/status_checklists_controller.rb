class StatusChecklistsController < ApplicationController
  # GET /status_checklists
  # GET /status_checklists.json
  def index
    @status_checklists = StatusChecklist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @status_checklists }
    end
  end

  # GET /status_checklists/1
  # GET /status_checklists/1.json
  def show
    @status_checklist = StatusChecklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status_checklist }
    end
  end

  # GET /status_checklists/new
  # GET /status_checklists/new.json
  def new
    @status_checklist = StatusChecklist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status_checklist }
    end
  end

  # GET /status_checklists/1/edit
  def edit
    @status_checklist = StatusChecklist.find(params[:id])
  end

  # POST /status_checklists
  # POST /status_checklists.json
  def create
    @status_checklist = StatusChecklist.new(params[:status_checklist])

    respond_to do |format|
      if @status_checklist.save
        format.html { redirect_to @status_checklist, notice: 'Status checklist was successfully created.' }
        format.json { render json: @status_checklist, status: :created, location: @status_checklist }
      else
        format.html { render action: "new" }
        format.json { render json: @status_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /status_checklists/1
  # PUT /status_checklists/1.json
  def update
    @status_checklist = StatusChecklist.find(params[:id])

    respond_to do |format|
      if @status_checklist.update_attributes(params[:status_checklist])
        format.html { redirect_to @status_checklist, notice: 'Status checklist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @status_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_checklists/1
  # DELETE /status_checklists/1.json
  def destroy
    @status_checklist = StatusChecklist.find(params[:id])
    @status_checklist.destroy

    respond_to do |format|
      format.html { redirect_to status_checklists_url }
      format.json { head :no_content }
    end
  end
end
