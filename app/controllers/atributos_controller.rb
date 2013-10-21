class AtributosController < ApplicationController

def index
   
    @search_atributo = params[:search_atributo] || session[:search_atributo]
    session[:search_atributo] = @search_atributo
    
    begin

      @atributos = Atributo.search @search_atributo, :match_mode => :boolean, :per_page => 20, :page => params[:page] #, :order => :valor
      @atributos.length
      @atributos.compact!
    rescue 
      flash[:error] = "Error[DB0001] - Search Engine desligado ou com problemas"
      @atributos = Atributo.where("valor is not null and valor <> ''").paginate(:page => params[:page])
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @atributos }
    end
  end

end


