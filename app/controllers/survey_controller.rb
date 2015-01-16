class SurveyController < ApplicationController

def show

    puts params[:id]

	@survey = Cadsurvey.find_by_key(params[:id])
	if @survey.nil?
		@mensagem = "Ocorreu um erro. Survey Inexistente."
		render :final and return
		# TODO logar esse erro em alguma console de erro..
	end
	# if @
	@formulario = @survey.formulario
	@respostas = @survey.respostas
	@key = @survey.key
	puts @respostas	
end

def update

end
end
