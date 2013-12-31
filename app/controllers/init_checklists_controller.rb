class InitChecklistsController < ApplicationController
  def new
    @checklist = Checklist.find(params[:checklist_id])
    @itens = @checklist.itens_checklists
    @pais = @checklist.pais
    @init_checklist = InitChecklist.new
    @init_checklist.descricao = @checklist.descricao
    @init_checklist.users = @checklist.users
    @init_checklist.checklist_id = @checklist.id


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @init_checklist }
    end
  end

  def create
    @init_checklist = InitChecklist.new(params[:init_checklist])
    puts @init_checklist.to_yaml

    respond_to do |format|
      if @init_checklist.valid?
        format.html { redirect_to [:checklist,@init_checklist], :action => 'show' , notice: 'Init checklist was successfully created.' }
        format.json { render json: @init_checklist, status: :created, location: @init_checklist }
      else
        format.html { render action: "new" }
        format.json { render json: @init_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

end
