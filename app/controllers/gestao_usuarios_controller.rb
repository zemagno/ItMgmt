class GestaoUsuariosController < ApplicationController


def load
  @erros = []

  # dois modos. :login --> achei um unico funcionario e vou direto para a pagina dele. :search --> achei varios e mostro uma listatem antes
  @mode = :login

  @login = params[:search] || session[:search_gestao_usuario]

  @login.strip! if ! @login.nil?

  # se for um ramal, recupero o @login
  if @login =~ /^\d{6}$/
    @mode = :login
    usr = TelRamalLogin.find_by_NumRamal(@login)
    if ! usr.nil?
       @login = usr.IdtLogin.strip if ! usr.nil? 
    else
       @login = nil
    end
  end
  
  # tento ir direto no login, se digitou uma unica palavra ou se login veio do Ramal
  if @login =~ /^[a-zA-z._]+$/
     @mode = :login
     # @usuario = GestaoUsuario.new(:login => @login)
  end

  # sempre instancio um usuario. ele retornara nada para as chamadas de licencas, celulares, etc
  # usuario tem as info do CMDB
  

  # com o login, eu procuro o funcionario 
  # funcionario tem as info do RM
  @funcionario = Funcionario.find_by_Login(@login)
  
   
  # se nao achei nenhum login, faco a pesquisa generica com nome 
  if @funcionario.nil? && ! @login.nil?
    @mode = :nome
    search = @login.strip.gsub(" ","%").gsub("%%","%")
    @f = Funcionario.where("NomProfissional like '%#{search}%'")
    session[:search_gestao_usuario] = ""
    @login = ""
    # se o resultado do where devolveu um unico funcionario, mudo o modo para :login
    if @f.count == 1
      @mode = :login
      @login = @f[0].Login
      @funcionario = @f[0]
    end
  end

  @usuario = GestaoUsuario.new(:login => @login)
  # se eu estou em modo de apresentar um usuario 
  if @mode == :login
    # tenho que deixar o login na sessao, pois ela será usada para alocacao de licencas, etc. Nao posso deixar o criterio de busca
    session[:search_gestao_usuario] = @login
    @nomecompleto = (@funcionario ) ? @funcionario.Nome : "Nao Identificado" 
    @licencas  = @usuario.LicencasEmUso
    @estacoes   = @usuario.Estacoes

       
    @celulares = @usuario.Celulares
    @placadados = @usuario.PlacaDados
    @monitores = @usuario.Monitores
    @ramais = @usuario.Ramais
    @posicaoFacilities = ""
    @posicaoFacilities << " #{@usuario.PosicaoFacilities.NomSite}-#{@usuario.PosicaoFacilities.NomAndarSite}-#{@usuario.PosicaoFacilities.NomPosicaoAndarSite}" if @usuario.PosicaoFacilities
    @erros.concat @usuario.DistorcoesUsoLicenca 
  
  end


end

# def loadOld
#   @erros = []

#   @login = params[:search] || session[:search_gestao_usuario]
#   @usuario = GestaoUsuario.new(:login => @login)

#   @funcionario = Funcionario.find_by_Login(@login)
  
#   session[:search_gestao_usuario] = @login 
#   @nomecompleto = (@funcionario ) ? @funcionario.Nome : "Nao Identificado" 
#   @licencas  = @usuario.LicencasEmUso
#   @estacoes   = @usuario.Estacoes
#   @celulares = @usuario.Celulares
#   @placadados = @usuario.PlacaDados
#   @monitores = @usuario.Monitores
#   @ramais =@usuario.Ramais
#   @posicaoFacilities = ""
#   @posicaoFacilities << " #{@usuario.PosicaoFacilities.NomSite}-#{@usuario.PosicaoFacilities.NomAndarSite}-#{@usuario.PosicaoFacilities.NomPosicaoAndarSite}" if @usuario.PosicaoFacilities
  
#   @erros.concat @usuario.DistorcoesUsoLicenca 
# end


def email
    # so seleciono os templates do tipo de ci sendo visualizado
    @id = params[:id]
    @controller="gestao_usuarios"
    
    @templates_email = TemplatesEmail.get_all_by_tipo_and_subtipo("GESTAO USUARIO","xxxx") #  esse metodo ta no Templates e nao pertence ao Rails
    Rails.logger.debug "[DEBUG]GestaoUsuarios:email Templates: [#{@templates_email}]"  
    respond_to do |format|
      format.js { 
        render :action => "../common/email", :format => [:js]        
      }
    end

    # respond_to :js
end

def enviar_email
    #testar se email é sync ou nao.. se for async, chamar abaixo, senao desviar para /email/{template}/:ci
    #aqui tem um problema...o controller que responde ao /email/template ja esta rodando numa nova tela...ele so responde um href.
    template_email = TemplatesEmail.find(params[:template_id])

    if template_email.sync
      @path = "/email/#{template_email.template}/#{params[:id]}"
      
      respond_to do |format|
         format.js { render :action => '../common/enviar_email_sync.js.erb' }
      end


    else
      p = Hash[:id => params[:id]]
      job = JobEnviarEmail.criar(params[:template_id], p.to_yaml)
      # EnviaEmailWorker.perform_async(job.id)
      
      flash[:info] = "INFO: Email enfileirado para envio"
      respond_to do |format|
          format.js { 
               render :action => "../common/enviar_email.js.erb"          
          }
      end
      # respond_to :js # so para fazer reload da pagina e sumir com 
    end
end

def index
  @modo = :vizualizacao

  load

  if @mode == :nome
     render :search and return
  end

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
    if (@estacaoalocada = GestaoEstacao.AlocarEstacao(params))
       flash[:info] = "INFO: Alocada estacao #{@estacaoalocada.chave} - #{@estacaoalocada.descricao} "
    else
      flash[:error] = "Erro: estacao nao foi alocada. Verifique se ela esta em estoque"
    end
    # @login = params[:id]
    # @licenca = params[:licenca]
    load 
    redirect_to :gestao_usuarios

end

def carrega_ativos_termo
  load

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
    @atributos = GestaoEstacao.Atributos
    load 
    render :index and return
end

def desalocar_estacao
  if (params[:confirmacao]==params[:token_confirmacao])
     GestaoEstacao.LiberaEstacao(:estacao => params[:token_confirmacao])
     flash[:info] = "Estacao devolvido para estoque"
  else
     flash[:error] = "Estacao nao desalocada"
  end

  @modo = :vizualizacao
  load
  redirect_to :gestao_usuarios

end

def escolher_licenca_alocar
    @modo = :alocar_licenca
    @login = params[:id]
    @licenca = params[:licenca]
    @licencasexistentes = GestaoLicenca.LicencasExistentes.map { |x| x[0]}
    load 
    render :index and return
end

def alocar_licenca
    @modo = :vizualizacao
    if (@licencaalocada = GestaoLicenca.AlocarLicenca(params))
       flash[:info] = "INFO: Alocada licenca #{@licencaalocada.chave} - #{@licencaalocada.descricao} "
    else
      flash[:error] = "Erro: Nao existe licenca disponivel para alocar"     
    end
    # @login = params[:id]
    # @licenca = params[:licenca]
    load 
    redirect_to :gestao_usuarios
end






def remover_licenca
  

# "confirmacao"=>"Office365E3_0008", 
# "token_confirmacao"=>"Office365E3_0008", 
# "id"=>"paulofreire"
  if (params[:confirmacao]==params[:token_confirmacao])
     GestaoLicenca.LiberaLicenca(:licenca => params[:token_confirmacao])
     flash[:info] = "Licenca Liberada"
  else
     flash[:error] = "Licencas Nao removida"
  end

  @modo = :vizualizacao
  load
  redirect_to :gestao_usuarios
end

end


