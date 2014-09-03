class RamalController < ApplicationController
  # GET /contratos
  # GET /contratos.xml
  #  layout 'application_novolyaout' 
  
  

  def index
    @search = params[:search] || " "

    qry = "select pf.origin as DDR, pfd.dest as SIP from pbx_forward as pf inner join pbx_forward_priority as pfp on pf.id = pfp.forward_id inner join pbx_forward_dest as pfd on pfd.priority_id = pfp.id where pf.origin = '#{@search.gsub(/\s+/, "")}';"
    result = InstantVoice.connection.execute(qry)
  
    @ramalfisico = ( result.count > 0 ? result.first[1] : "Nao Encontrado" ) 
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
end
