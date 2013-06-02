class TipoTasksController < ApplicationController
  # GET /tipo_tasks
  # GET /tipo_tasks.json
  def index
    @tipo_tasks = TipoTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_tasks }
    end
  end

  # GET /tipo_tasks/1
  # GET /tipo_tasks/1.json
  def show
    @tipo_task = TipoTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_task }
    end
  end

  # GET /tipo_tasks/new
  # GET /tipo_tasks/new.json
  def new
    @tipo_task = TipoTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_task }
    end
  end

  # GET /tipo_tasks/1/edit
  def edit
    @tipo_task = TipoTask.find(params[:id])
  end

  # POST /tipo_tasks
  # POST /tipo_tasks.json
  def create
    @tipo_task = TipoTask.new(params[:tipo_task])

    respond_to do |format|
      if @tipo_task.save
        format.html { redirect_to @tipo_task, notice: 'Tipo task was successfully created.' }
        format.json { render json: @tipo_task, status: :created, location: @tipo_task }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_tasks/1
  # PUT /tipo_tasks/1.json
  def update
    @tipo_task = TipoTask.find(params[:id])

    respond_to do |format|
      if @tipo_task.update_attributes(params[:tipo_task])
        format.html { redirect_to @tipo_task, notice: 'Tipo task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_tasks/1
  # DELETE /tipo_tasks/1.json
  def destroy
    @tipo_task = TipoTask.find(params[:id])
    @tipo_task.destroy

    respond_to do |format|
      format.html { redirect_to tipo_tasks_url }
      format.json { head :no_content }
    end
  end
end
