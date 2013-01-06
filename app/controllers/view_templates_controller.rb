class ViewTemplatesController < ApplicationController
  # GET /view_templates
  # GET /view_templates.json
  def index
    @view_templates = ViewTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @view_templates }
    end
  end

  # GET /view_templates/1
  # GET /view_templates/1.json
  def show
    @view_template = ViewTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @view_template }
    end
  end

  # GET /view_templates/new
  # GET /view_templates/new.json
  def new
    @view_template = ViewTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @view_template }
    end
  end

  # GET /view_templates/1/edit
  def edit
    @view_template = ViewTemplate.find(params[:id])
  end

  # POST /view_templates
  # POST /view_templates.json
  def create
    @view_template = ViewTemplate.new(params[:view_template])

    respond_to do |format|
      if @view_template.save
        format.html { redirect_to @view_template, notice: 'View template was successfully created.' }
        format.json { render json: @view_template, status: :created, location: @view_template }
      else
        format.html { render action: "new" }
        format.json { render json: @view_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /view_templates/1
  # PUT /view_templates/1.json
  def update
    @view_template = ViewTemplate.find(params[:id])

    respond_to do |format|
      if @view_template.update_attributes(params[:view_template])
        format.html { redirect_to @view_template, notice: 'View template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @view_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /view_templates/1
  # DELETE /view_templates/1.json
  def destroy
    @view_template = ViewTemplate.find(params[:id])
    @view_template.destroy

    respond_to do |format|
      format.html { redirect_to view_templates_url }
      format.json { head :no_content }
    end
  end
end
