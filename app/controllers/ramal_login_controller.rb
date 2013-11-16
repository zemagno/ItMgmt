class RamalLoginController < ApplicationController
  def index
  	id = params[:search] || session[:search_ramal]
  	puts id
  	puts id.class
    if id.nil? or id == ""
    	puts "vou criar um novo"
    	@ramal = TelRamalLogin.new
    	puts @ramal.class
    else 
    	puts "vou procurar"
    	@ramal = TelRamalLogin.where(:IdtLogin => id)[0]
    	if @ramal.nil?
    		puts "nao achei..vou criar"
    		@ramal = TelRamalLogin.first
    		puts TelRamalLogin.first.class
    		puts TelRamalLogin.new.class
    		
    	end
    	puts @ramal
    	puts @ramal.NumRamal 
    end
  end
end
