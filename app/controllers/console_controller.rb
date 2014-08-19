class ConsoleController < ApplicationController
 
   layout 'console' 
    def index
      #if can? :manage, @alertas
         @tasks = Task.ativos
    #else
    #     puts "nao pode manage"
    #     @tasks = Task.publicas
    #end
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @tasks }
      end
    end

end