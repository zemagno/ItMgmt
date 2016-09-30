class LogDesligamentoController < ApplicationController


  def ws_register_desligamento

    LogDesligamento.new(:login => params[:login], :ip => remote_ip, :data => params[:data]).save!

  	status = "{status:ok}"
    respond_to do |format|
      format.xml { render :xml => status }  
    end
  end
end


# curl -H "Content-Type: application/json" -X POST -d '{"login":"magno","data":"12/07/2015"}' http://127.0.0.1:3000/ws_register_desligamento
