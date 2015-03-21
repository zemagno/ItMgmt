class Custom::GestaoUsuariosController < ApplicationController


def load
  @erros = []


  @login = params[:search] || session[:search_gestao_usuario]
  session[:search_gestao_usuario] = @login

  puts "[#{@login}]"
  puts params[:search]
  puts params

  @usuario = Custom::GestaoUsuario.new(:login => @login)

  
  @nomecompleto = (@funcionario = Funcionario.find_by_Login(@login)) ? @funcionario.Nome : "Nao Identificado" 
  @licencas  = @usuario.LicencasEmUso
  @estacao   = @usuario.Estacoes
  @celulares = @usuario.Celulares
  
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
    @modo = :remocao_licenca
    @login = params[:id]
    @licenca = params[:licenca]
    load 
    render :index and return
end

def escolher_licenca_alocar
    @modo = :alocar_licenca
    @login = params[:id]
    @licenca = params[:licenca]
    @licencasexistentes = Custom::GestaoLicenca.LicencasExistentes.map { |x| x[0]}
    load 
    render :index and return
end

def alocar_licenca
    @modo = :vizualizacao
    puts params
    if (@licencaalocada = Custom::GestaoLicenca.AlocarLicenca(params))
       puts "aloquei"
       flash[:info] = "INFO: Alocada licenca #{@licencaalocada.chave} - #{@licencaalocada.descricao} "
    else
      flash[:error] = "Erro: Nao existe licenca disponivel para alocar"
      puts "nao achei nada"
    end
    # @login = params[:id]
    # @licenca = params[:licenca]
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


