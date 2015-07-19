class Custom::GestaoUsuariosController < ApplicationController


def load
  @erros = []


  @login = params[:search] || session[:search_gestao_usuario]
  session[:search_gestao_usuario] = @login

  @usuario = Custom::GestaoUsuario.new(:login => @login)
  
  @nomecompleto = (@funcionario = Funcionario.find_by_Login(@login)) ? @funcionario.Nome : "Nao Identificado" 
  @licencas  = @usuario.LicencasEmUso
  @estacoes   = @usuario.Estacoes
  @celulares = @usuario.Celulares
  @placadados = @usuario.PlacaDados
  @monitores = @usuario.Monitores
  @ramais =@usuario.Ramais
  @posicaoFacilities = ""
  @posicaoFacilities = " #{@usuario.PosicaoFacilities.NomSite}-#{@usuario.PosicaoFacilities.NomAndarSite}-#{@usuario.PosicaoFacilities.NomPosicaoAndarSite}" if @usuario.PosicaoFacilities
  
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


def confirmar_desalocar_estacao
    @modo = :desalocar_estacao
    @login = params[:id]
    @estacao = params[:estacao]
    load 
    render :index and return
  
end

def alocar_estacao
    @modo = :vizualizacao
    puts params
    if (@estacaoalocada = Custom::GestaoEstacao.AlocarEstacao(params))
       puts @estacaoalocada
       flash[:info] = "INFO: Alocada estacao #{@estacaoalocada.chave} - #{@estacaoalocada.descricao} "
    else
      flash[:error] = "Erro: estacao nao foi alocada. Verifique se ela esta em estoque"
    end
    # @login = params[:id]
    # @licenca = params[:licenca]
    load 
    redirect_to :custom_gestao_usuarios

end

def carrega_ativos_termo
  load

 puts params
  @ativos_termo = []
  

  if params[:tipo] == "estacao" || params[:tipo] == "__ALL__"
     
     @estacoes.each do |x|
        @ativos_termo << x if params[:tipo] == "__ALL__" || x[:chave] == params[:ativo]
     end 
  end
  
  if params[:tipo] == "celular" || params[:tipo] == "__ALL__"
     @celulares.each do |x|
        @ativos_termo << x if params[:tipo] == "__ALL__" || x[:chave] == params[:ativo]
     end   
  end

  if params[:tipo] == "placadados" || params[:tipo] == "__ALL__"
      
     @placadados.each do |x|
        @ativos_termo << x if params[:tipo] == "__ALL__" || x[:chave] == params[:ativo]
     end 
  end

  if params[:tipo] == "monitor" || params[:tipo] == "__ALL__"
      
     @monitores.each do |x|
        @ativos_termo << x if params[:tipo] == "__ALL__" || x[:chave] == params[:ativo]
     end 
  end

end

def imprimir_termo_entrega
  
  carrega_ativos_termo


  @termo = [:entrega,"entrega","que recebi"]
  render "imprimir_termo", layout: "plain"
  
end


def imprimir_termo_devolucao
  carrega_ativos_termo
  @termo = [:devolucao,"devolucao","a devolu&ccedil;&atilde;o"]
  render "imprimir_termo", layout: "plain"
  
end

def escolher_estacao_alocar
    @modo = :alocar_estacao
    @login = params[:id]
    @atributos = Custom::GestaoEstacao.Atributos
    load 
    render :index and return
end

def desalocar_estacao
  if (params[:confirmacao]==params[:token_confirmacao])
     Custom::GestaoEstacao.LiberaEstacao(:estacao => params[:token_confirmacao])
     flash[:info] = "Estacao devolvido para estoque"
  else
     flash[:error] = "Estacao nao desalocada"
  end

  @modo = :vizualizacao
  load
  redirect_to :custom_gestao_usuarios

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
    if (@licencaalocada = Custom::GestaoLicenca.AlocarLicenca(params))
       flash[:info] = "INFO: Alocada licenca #{@licencaalocada.chave} - #{@licencaalocada.descricao} "
    else
      flash[:error] = "Erro: Nao existe licenca disponivel para alocar"     
    end
    # @login = params[:id]
    # @licenca = params[:licenca]
    load 
    redirect_to :custom_gestao_usuarios
end






def remover_licenca
  

# "confirmacao"=>"Office365E3_0008", 
# "token_confirmacao"=>"Office365E3_0008", 
# "id"=>"paulofreire"
  if (params[:confirmacao]==params[:token_confirmacao])
     Custom::GestaoLicenca.LiberaLicenca(:licenca => params[:token_confirmacao])
     flash[:info] = "Licenca Liberada"
  else
     flash[:error] = "Licencas Nao removida"
  end

  @modo = :vizualizacao
  load
  redirect_to :custom_gestao_usuarios
end

end


