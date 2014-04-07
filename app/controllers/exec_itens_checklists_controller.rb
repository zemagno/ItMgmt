class ExecItensChecklistsController < ApplicationController
  # GET /exec_itens_checklists
  # GET /exec_itens_checklists.json
  def index
    @exec_itens_checklists = ExecItensChecklist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exec_itens_checklists }
    end
  end

  # GET /exec_itens_checklists/1
  # GET /exec_itens_checklists/1.json
  def show
    @exec_itens_checklist = ExecItensChecklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exec_itens_checklist }
    end
  end

  # GET /exec_itens_checklists/new
  # GET /exec_itens_checklists/new.json
  def new
    @exec_itens_checklist = ExecItensChecklist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exec_itens_checklist }
    end
  end

  # GET /exec_itens_checklists/1/edit
  def edit
    @exec_itens_checklist = ExecItensChecklist.find(params[:id])
  end

  # POST /exec_itens_checklists
  # POST /exec_itens_checklists.json
  def create
    @exec_itens_checklist = ExecItensChecklist.new(params[:exec_itens_checklist])

    respond_to do |format|
      if @exec_itens_checklist.save
        format.html { redirect_to @exec_itens_checklist, notice: 'Exec itens checklist was successfully created.' }
        format.json { render json: @exec_itens_checklist, status: :created, location: @exec_itens_checklist }
      else
        format.html { render action: "new" }
        format.json { render json: @exec_itens_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exec_itens_checklists/1
  # PUT /exec_itens_checklists/1.json
  def update
    @exec_itens_checklist = ExecItensChecklist.find(params[:id])

    respond_to do |format|
      if @exec_itens_checklist.update_attributes(params[:exec_itens_checklist])
        format.html { redirect_to @exec_itens_checklist, notice: 'Exec itens checklist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exec_itens_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exec_itens_checklists/1
  # DELETE /exec_itens_checklists/1.json
  def destroy
    @exec_itens_checklist = ExecItensChecklist.find(params[:id])
    @exec_itens_checklist.destroy

    respond_to do |format|
      format.html { redirect_to exec_itens_checklists_url }
      format.json { head :no_content }
    end
  end
end
