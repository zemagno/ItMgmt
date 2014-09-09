class ExecChecklistsController < ApplicationController
  # GET /exec_checklists
  # GET /exec_checklists.json
  # 
  def carrega_agregados
    @url_jira = Parametro.get(:tipo => "JIRA", :subtipo => "URL")

  end

  def index
    carrega_agregados
    @exec_checklists = ExecChecklist.abertas

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exec_checklists }
    end
  end

  # GET /exec_checklists/1
  # GET /exec_checklists/1.json
  def show
    carrega_agregados
    @exec_checklist = ExecChecklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exec_checklist }
    end
  end

  # GET /exec_checklists/new
  # GET /exec_checklists/new.json
  def new
    @exec_checklist = ExecChecklist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exec_checklist }
    end
  end

  # GET /exec_checklists/1/edit
  def edit
    @exec_checklist = ExecChecklist.find(params[:id])
  end

  # POST /exec_checklists
  # POST /exec_checklists.json
  def create
    @exec_checklist = ExecChecklist.new(params[:exec_checklist])

    respond_to do |format|
      if @exec_checklist.save
        format.html { redirect_to @exec_checklist, notice: 'Exec checklist was successfully created.' }
        format.json { render json: @exec_checklist, status: :created, location: @exec_checklist }
      else
        format.html { render action: "new" }
        format.json { render json: @exec_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exec_checklists/1
  # PUT /exec_checklists/1.json
  def update
    @exec_checklist = ExecChecklist.find(params[:id])

    respond_to do |format|
      if @exec_checklist.update_attributes(params[:exec_checklist])
        format.html { redirect_to @exec_checklist, notice: 'Exec checklist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exec_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exec_checklists/1
  # DELETE /exec_checklists/1.json
  def destroy
    @exec_checklist = ExecChecklist.find(params[:id])
    @exec_checklist.destroy

    respond_to do |format|
      format.html { redirect_to exec_checklists_url }
      format.json { head :no_content }
    end
  end
end
