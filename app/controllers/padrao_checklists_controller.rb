class PadraoChecklistsController < ApplicationController
  # GET /padrao_checklists
  # GET /padrao_checklists.xml
  def index
    @padrao_checklists = PadraoChecklist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @padrao_checklists }
    end
  end

  # GET /padrao_checklists/1
  # GET /padrao_checklists/1.xml
  def show
    @padrao_checklist = PadraoChecklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @padrao_checklist }
    end
  end

  # GET /padrao_checklists/new
  # GET /padrao_checklists/new.xml
  def new
    @padrao_checklist = PadraoChecklist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @padrao_checklist }
    end
  end

  # GET /padrao_checklists/1/edit
  def edit
    @padrao_checklist = PadraoChecklist.find(params[:id])
  end

  # POST /padrao_checklists
  # POST /padrao_checklists.xml
  def create
    @padrao_checklist = PadraoChecklist.new(params[:padrao_checklist])

    respond_to do |format|
      if @padrao_checklist.save
        format.html { redirect_to(@padrao_checklist, :notice => 'Padrao checklist was successfully created.') }
        format.xml  { render :xml => @padrao_checklist, :status => :created, :location => @padrao_checklist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @padrao_checklist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /padrao_checklists/1
  # PUT /padrao_checklists/1.xml
  def update
    @padrao_checklist = PadraoChecklist.find(params[:id])

    respond_to do |format|
      if @padrao_checklist.update_attributes(params[:padrao_checklist])
        format.html { redirect_to(@padrao_checklist, :notice => 'Padrao checklist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @padrao_checklist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /padrao_checklists/1
  # DELETE /padrao_checklists/1.xml
  def destroy
    @padrao_checklist = PadraoChecklist.find(params[:id])
    @padrao_checklist.destroy

    respond_to do |format|
      format.html { redirect_to(padrao_checklists_url) }
      format.xml  { head :ok }
    end
  end
end
