class Custom::GestaoUsuariosController < ApplicationController


def load
  @erros = []


  @login = params[:search] || session[:search_gestao_usuario]
  session[:search_gestao_usuario] = @login

  puts "[#{@login}]"
  puts params[:search]
  puts params

  @usuario = Custom::GestaoUsuario.new(:login => @login)

  @nomecompleto = (f = Funcionario.find_by_Login(@login)) ? f.Nome : "Nao Identificado" 
  @licencas  = @usuario.LicencasEmUso
  @estacao   = @usuario.Estacoes
  
  @erros.concat @usuario.DistorcoesUsoLicenca 
end


def index


  @modo = :vizualizacao

  load  
  
  respond_to do |format|
      format.html # index.html.erb
    end
end

def confirmar_remocao_licenca
    @modo = :remocao
    @login = params[:id]
    @licenca = params[:licenca]
    load 
    render :index and return
end

def alocar_licenca
    @modo = :alocar_licenca
    @login = params[:id]
    @licenca = params[:licenca]
    load 
    render :index and return
end


def alocar_estacao
    @modo = :alocar_estacao
    @login = params[:id]
    @licenca = params[:licenca]
    load 
    render :index and return
end




def remover_licenca
  @modo = :vizualizacao


# "confirmacao"=>"Office365E3_0008", 
# "token_confirmacao"=>"Office365E3_0008", 
# "id"=>"paulofreire"
  if (params[:confirmacao]==params[:token_confirmacao])
     Custom::GestaoLicenca.LiberaLicenca(:licenca => params[:token_confirmacao])
     flash[:info] = "Licenca Liberada"
  else
     flash[:error] = "Licencas Nao removida"
  end

  load
  
  redirect_to :custom_gestao_usuarios
end

end


