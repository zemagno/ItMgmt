class AuditsController < ApplicationController
  # GET /audits
  # GET /audits.json
  authorize_resource 
  def index
    @search = params[:search] || session[:search_audit]
    session[:search_audit] = @search
  
    
    begin
      Rails.logger.debug "[DEBUG] AuditsController:index search:[#{@search}] params:[#{params}]"
      @audits = Audit.search @search, :match_mode => :boolean, :per_page => 20, :page => params[:page] #, :order => 'created_at DESC'
      @audits.length
      @audits.compact!
    rescue => error
      error.backtrace
      Rails.logger.debug "[DEBUG] Error[DB0001]"
      flash[:error] = "Error[DB0001] - Search Engine com Problema"
      @audits = Audit.paginate(:page => params[:page])
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audits }
    end
  end

  # GET /audits/1
  # GET /audits/1.json
  def show
    @audit = Audit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @audit }
    end
  end

  end
