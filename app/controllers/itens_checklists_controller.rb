class ItensChecklistsController < ApplicationController
  # GET /itens_checklists
  # GET /itens_checklists.json
  def index
    @itens_checklists = ItensChecklist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itens_checklists }
    end
  end

  # GET /itens_checklists/1
  # GET /itens_checklists/1.json
  def show
    @itens_checklist = ItensChecklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itens_checklist }
    end
  end

  # GET /itens_checklists/new
  # GET /itens_checklists/new.json
  def new
    @itens_checklist = ItensChecklist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itens_checklist }
    end
  end

  # GET /itens_checklists/1/edit
  def edit
    @itens_checklist = ItensChecklist.find(params[:id])
  end

  # POST /itens_checklists
  # POST /itens_checklists.json
  def create
    @itens_checklist = ItensChecklist.new(params[:itens_checklist])

    respond_to do |format|
      if @itens_checklist.save
        format.html { redirect_to @itens_checklist, notice: 'Itens checklist was successfully created.' }
        format.json { render json: @itens_checklist, status: :created, location: @itens_checklist }
      else
        format.html { render action: "new" }
        format.json { render json: @itens_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /itens_checklists/1
  # PUT /itens_checklists/1.json
  def update
    @itens_checklist = ItensChecklist.find(params[:id])

    respond_to do |format|
      if @itens_checklist.update_attributes(params[:itens_checklist])
        format.html { redirect_to @itens_checklist, notice: 'Itens checklist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itens_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itens_checklists/1
  # DELETE /itens_checklists/1.json
  def destroy
    @itens_checklist = ItensChecklist.find(params[:id])
    @itens_checklist.destroy

    respond_to do |format|
      format.html { redirect_to itens_checklists_url }
      format.json { head :no_content }
    end
  end
end
