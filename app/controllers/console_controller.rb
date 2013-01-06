class ConsoleController < ApplicationController
 
   layout 'console' 
    def index
      @tasks = Task.ativos
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @tasks }
      end
    end

end