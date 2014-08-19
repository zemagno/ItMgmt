
require "queueable"
include ApplicationHelper
class CisController < ApplicationController
  include Queueable
  authorize_resource #cancan

  #layout 'application_novolyaout' 

  # Variaveis geradas por esse controller
  # @fila_impactados
  # @fila_dependentes
  # @imagem_impactados
  # @imagem_dependentes
  # @ci
  # @atributos
  # @sites
  # @tiposci

  # TODO colocar carrega agregadas no before_action/before_filter para alguns metodos abaixo..
  def carrega_agregadas 
    @sites = Site.all
    @tiposci = Tipoci.all
    @statusci = Statusci.all
  end

  def cache(ci)
    session[:oldCI] = ci.id
    @filaNavegacao = session[:filaNavegacao]
    @filaNavegacao ||= Fila.new
    @filaNavegacao.enfilera(ci.id)
    session[:filaNavegacao] = @filaNavegacao 
  end
 
  def show
    @search = session[:search_cis]
    @ci, @atributos = Ci.find_com_atributos(params[:id])
    if @ci
        cache(@ci) 
    else 
      flash[:error] = "CI Invalido"
      redirect_to "/cis"
    end
  end
  
  def edit
    @ci, @atributos = Ci.find_com_atributos(params[:id])
    carrega_agregadas
  end

  # cis#email 
  #   monta lista de templates 
  #   direciona email.js.erb que troca o div pelo formulario email.erb
  # email.erb (form)
  #   submit form cis#enviar_email   
  #   enfilera no sidekiq
  #   direciona para enviar_email.js que faz reload da pagina cis 

  
  def email
    # so seleciono os templates do tipo de ci sendo visualizado
    @id = params[:id]
    t = Ci.find(@id).tipoci.tipo
    # @templates_email = TemplatesEmail.find_all_by_tipo_and_subtipo("CI",t)
    # @templates_email.concat(TemplatesEmail.find_all_by_tipo_and_subtipo("CI",""))  
    @templates_email = TemplatesEmail.find_by_tipo_and_subtipo("CI",t) #  esse metodo ta no Templates e nao pertence ao Rails

    respond_to :js
    
  end

  def enviar_email
    #testar se email é sync ou nao.. se for async, chamar abaixo, senao desviar para /email/{template}/:ci
    #aqui tem um problema...o controller que responde ao /email/template ja esta rodando numa nova tela...ele so responde um href.
    template_email =TemplatesEmail.find(params[:enviar_email][:template_id])

    if template_email.sync
      @path = "/email/#{template_email.template}/#{params[:id]}"
      
      respond_to do |format|
       format.js { render :action => 'enviar_email_sync.js.erb' }
      end


    else
      p = Hash[:id => params[:id]]
      job = JobEnviarEmail.criar(params[:enviar_email][:template_id], p.to_yaml)
      EnviaEmailWorker.perform_async(job.id)
      #EnviaEmailWorker.perform_in(1.hour,job.id)
      flash[:info] = "INFO: Email enfileirado para envio"
      respond_to :js # so para fazer reload da pagina e sumir com 
    end
  end
  # http://stackoverflow.com/questions/7165064/how-do-i-preview-emails-in-rails

   
  def check_chave
    @ci = Ci.find_by_chave(params[:search]) 
    respond_to do |format|
      if @ci == nil then
        format.json { render :json => "inexistente"}
      else
       format.json { render :json => "existente"}
    end
   end    
  end
  

  
  def todos
    @cis = Ci.paginate(:per_page => 1000000, :page => 1)
    respond_to do |format|
      format.html { render :index }
      format.xml  { render :xml => @cis }
    end
  end

  def index

    @search = params[:search] || session[:search_cis]
    session[:search_cis] = @search
    session[:oldCI] = nil 
    begin
      if @search.blank?

         @cis = Ci.paginate(:page => params[:page])
      elsif @search[0] =="%"
        @cis = Ci.includes(:atributo).where("atributos.valor like ?", @search).paginate(:page => params[:page])
      else
         @cis = Ci.search @search, :match_mode => :boolean, :per_page => 20, :page => params[:page]
         @cis.length
         @cis.compact!
      end
    rescue 
      flash[:error] = "Error[DB0001] - Erro no mecanismo de busca. Listando tudo !"
      @cis = Ci.paginate(:page => params[:page])
    end 

    #if @cis.size==0 then
    #    @cis = Ci.includes(:atributo).where("atributos.valor like ?", "%#{@search}%").paginate(:page => params[:page])
    #end
    
    if (@cis.count == 1) && (params[:commit] == "Estou com sorte")
      @ci = @cis[0]
      render :show and return
    end

    respond_to do |format|
        format.html
        format.json { render :json => @cis }
        format.xml  { render :xml => @cis }
    end
  end
  
  def sobe
    filaNavegacao = session[:filaNavegacao]
    @ci, @atributos = Ci.find_com_atributos(filaNavegacao.anterior)
    render :show
  end
  
  def desce
    filaNavegacao = session[:filaNavegacao]
    @ci, @atributos = Ci.find_com_atributos(filaNavegacao.proximo)
    render :show
  end
  
  def new
    @ci = Ci.new
    carrega_agregadas
    @oldci = session[:oldCI]==nil ? nil : Ci.find(session[:oldCI])
  end
  
  def create
      @ci = Ci.new(params[:ci])
      puts ">>>> #{params[:ci]} <<<<<"
      case params[:dependencia]
        when "2"    
          @ci.dependentes << Ci.find(session[:oldCI])
        when "3" 
          @ci.impactados << Ci.find(session[:oldCI])
      end
      puts "=================================================================="
      puts params[:ci]

      puts "=================================================================="
      respond_to do |format|
        if @ci.save  
          # TODO ERRO !!!
          # ERROR ERRO !!!! 
          #@ci.limpa_atributos_outros_tipo        
          format.html { redirect_to(@ci, :notice => 'CI criada com sucesso.') }
        else
          carrega_agregadas
          format.html { render :action => "new" }
        end
      end 
  end

  def update
    @ci = Ci.find(params[:id])

    
    respond_to do |format|
      if @ci.update_attributes(params[:ci])
         @ci.atributos = params[:atributos]
         @ci.limpa_atributos_outros_tipo
         format.html { redirect_to @ci, notice: 'Item foi salvo !! ' }
         format.json { head :no_content }
      else
         @atributos = @ci.atributos
         carrega_agregadas
         format.html { render action: "edit" }
         format.json { render json: @ci.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def search
    @ci = Ci.find_by_chave(params[:search])
    
    if @ci == nil then
       flash[:error] = "CI: \"#{params[:search]}\" nao encontrado"
        # @ci = Ci.find(session[:oldCI])
        # @atributos = @ci.atributos
        @ci, @atributos = Ci.find_com_atributos(session[:oldCI])
        redirect_to(@ci) and return
    end
    @atributos = @ci.atributos 
    cache(@ci)
    render :show
  end

  # olhar dicas em http://www.omninerd.com/articles/Automating_Data_Visualization_with_Ruby_and_Graphviz
  # 

  def gera_grafico_relacionamento(id,direcao)
    
    # TODO - tirar esse else daqui...retornar 
    # FIXME isso aqui tem um erro.... o g.output nao tem @ci
    if ! Rails.cache.exist?("#{direcao}-#{@ci.id}-grafico")
      apath =  File.expand_path('../../../public', __FILE__)
      g = GraphViz::new( "G" )

      nodes = Hash.new
      edges_visitado = Hash.new
      nivel_max = 4

      @ci = Ci.find(id)
      init_queue
      enqueue([@ci,0])

      # essa navegacao so termina por conta do nivel maximo, pois ele nao checa se ja visitou um CI antes
      # A--> B --> A --> B --> A
      # Isso existe para fazer a seta poder apontar "para cima"
  

      while not queue.empty?
          #retira (e retorna) o primeiro elementro da fila ([impactado, nivel])
          @i,nivel = dequeue
          if @i.ativo? 
            nodes[@i.chave] = g.add_nodes(@i.chave, GraficoCmdb.TipoGraficoCI(@i,ci_path(@i)))
            if nivel <= nivel_max then
              @i.send(direcao).each do |ii|
                  #erro ??!?!?! nao testo a data de mudanca ???
                  #TODO aqui tem um erro..eu adiciono sem testar data, sem usar o GraficoCmdb
                  # eu desconfio que ele sempre aciona pelo add_nodes acima e nunca por esse.
                  if ii.ativo? 
                    nodes[ii.chave] = g.add_nodes(ii.chave) 
                   
                    if not edges_visitado[@i.chave+"#"+ii.chave] then   
                      g.add_edges(nodes[@i.chave], nodes[ii.chave]) #, { :style => "dashed" })
                      edges_visitado[@i.chave+"#"+ii.chave] = true
                    end
                  end
              end    

              # retorna uma matrix com varios elementos (.map)
              # transforma cada elemento impactado num array com [impactado, nivel + 1]
              # concatena essas tuplas de impactados no final da fila

              @i.send(direcao).map { |x| enqueue([x,nivel+1])}
            end # nivel <= nivel_max
          end # ci.ativo
      end
      g.output( :svg => apath+"/imagens/#{@ci.chave_sanitizada}-#{direcao}.svg" )
      logger.debug "gravei grafico no cache"
      Rails.cache.write("#{direcao}-#{@ci.id}-grafico", "Existe",   expires_in: 5.minute)
    end

    
  end

  def gera_relaciomentos (direcao)
    @ci = Ci.find(params[:id])    
    if Rails.cache.exist?("#{direcao}-#{@ci.id}")
       @fila_resultado = Rails.cache.read("#{direcao}-#{@ci.id}")
       @email_impactados = Rails.cache.read("#{direcao}-#{@ci.id}-email")
       logger.debug  "Ops... li do cache"
    else
      logger.debug "vou ler do db"
      @email_impactados = ""
      init_queue
      @email_impactados << @ci.Owner unless @ci.Owner.nil? or @ci.Owner == ""
      @email_impactados << ","+@ci.notificacao unless @ci.notificacao.nil? or @ci.notificacao == ""


      enqueue([@ci,0])
      edges_visitado = Hash.new

      nivel_max = 8
      nivel_max_email = 8

      @fila_resultado = []

      while not queue_empty?
        #retira (e retorna) o primeiro elementro da fila ([impactado, nivel])
        i,nivel = dequeue
        if nivel <= nivel_max then # aqui tem que entrar todos os filtros
            if (not edges_visitado[i.chave]) then #&& ("fornecedor fatura contrato".include? i.tipoci.tipo) then        
                edges_visitado[i.chave] = true
                # if && ("fornecedor fatura contrato".include? i.tipoci.tipo) then
                @email_impactados << ","+i.Owner unless i.Owner.nil? or i.Owner == "" or nivel>nivel_max_email
                @email_impactados << ","+@ci.notificacao unless @ci.notificacao.nil? or @ci.notificacao == "" or nivel>nivel_max_email

                @fila_resultado << [:ci,i] unless i.send(direcao).empty?
                i.send(direcao).each do |ii|
                    @fila_resultado << [:subci,ii, "Depende de"]
                end
            end    

          # retorna uma matrix com varios elementos (.map)
          # transforma cada elemento impactado numa tupla com [impactado, nivel + 1]
          # concatena essas tuplas de impactados no final da fila

          i.send(direcao).map { |x| enqueue([x,nivel+1])}
        end
      end
      @email_impactados = ListaEmail.acerta(@email_impactados,"@brq.com")
      Rails.cache.write("#{direcao}-#{@ci.id}", @fila_resultado, expires_in: 5.minute)
      Rails.cache.write("#{direcao}-#{@ci.id}-email",@email_impactados,  expires_in: 5.minute)
      logger.debug  "escrevi no cache"
    end
    @fila_resultado
    # TODO acertar esse lixo...retornar tudo...@fila e @email impactado..
    #    devolve fila resultado e seta variavel global email impactado
    #    mover esse lixo para um servico....retornando 2 variaveis.
  end

def gera_relaciomentos_com_composto_de
    # TODO colocar cache no gera_relaciomentos_com_composto_de
    @ci = Ci.find(params[:id])
    init_queue
    
    enqueue([@ci,0])
    edges_visitado = Hash.new

    # FIXME nao tem email impactado ?

    nivel_max = 8

    @fila_resultado = []

    while not queue_empty?
      #retira (e retorna) o primeiro elementro da fila ([impactado, nivel])
      i,nivel = dequeue
      if nivel <= nivel_max then
          if not edges_visitado[i.chave] then        
              edges_visitado[i.chave] = true
              @fila_resultado << [:ci,i] unless i.dependentes.empty?
              i.dependentes.each do |ii|
                  @fila_resultado << [:subci,ii,"Depende de"]
              end
              i.composto_de.each do |ii|
                  @fila_resultado << [:subci,ii,"Composto por"]
              end

          end    

        # retorna uma matrix com varios elementos (.map)
        # transforma cada elemento impactado numa tupla com [impactado, nivel + 1]
        # concatena essas tuplas de impactados no final da fila

        i.dependentes.map { |x| enqueue([x,nivel+1])}
        i.composto_de.map { |x| enqueue([x,nivel+1])}
        
      end
    end
    @fila_resultado
end

  def eliminar
    @ci = Ci.find(params[:idci])
    if (params[:id]==params[:idci]) && (params['Digite ELIMINAR']==params['token_confirmacao'])
       chave = @ci.chave
       @ci.destroy
       @ci.save
       flash[:info] = "#{chave} Eliminado com sucesso !!!"
       redirect_to :controller => 'cis', :action => 'index' 
    else

       flash[:error] = "Confirmacao errada !!!"
       render :confirmar_eliminacao
    end
     
   end

   def confirmar_eliminacao
      @ci, @atributos = Ci.find_com_atributos(params[:id])      

   end

  def novo_dependente
     @dependente = ""
     @idci = params[:id]
     respond_to :js
   end

  def novo_impactado
    @impactado = ""
    @idci = params[:id]
    respond_to :js
   end

  def ask_elimina_dependente
    @dependente = ""
    @idci = params[:id]
    respond_to :js
   end

   def ask_duplicar_ci
    @dependente = ""
    @idci = params[:id]
    logger.debug "Ops....estou no caminho certo..."
    respond_to :js
   end

  def duplicar_ci
    ci = Ci.find(params[:idci])
    @newci = ci.duplicar(params[:duplicar][:nova_chave])

    respond_to :js if @newci.persisted?
  end


  def elimina_dependente
    
     ci = Ci.find(params[:idci])
     dep = Ci.find_by_chave(params[:exclusao][:dependente]) 
     if dep == nil || ! ci.dependentes_all.include?(dep) then
        flash[:error] = "CI: \"#{params[:exclusao][:dependente]}\" nao encontrado ou nao dependente de \"#{ci.chave}\""
     else 
        ci.dependentes_all.delete(dep)
        ci.save
     end
     respond_to :js
   end

  def elimina_impactado
 
     ci = Ci.find(params[:idci])
     imp = Ci.find_by_chave(params[:exclusao][:impactado]) 
     if imp == nil || ! ci.impactados.include?(imp) then
        flash[:error] = "CI: \"#{params[:exclusao][:dependente]}\" nao encontrado ou nao impactado por \"#{ci.chave}\""
     else 
        ci.impactados.delete(imp)
        ci.save
     end
     respond_to :js
   end

  def ask_elimina_impactado
     @impactado = ""
     @idci = params[:id]
     respond_to :js
     
  end

  def gera_novo_dependente
    ci = Ci.find(params[:idci])
    dep = Ci.find_by_chave(params[:inclusao][:dependente]) 
    if dep == nil then
        flash[:error] = "CI: \"#{params[:inclusao][:dependente]}\" nao encontrado"
    else 
        ci.dependentes << dep
        ci.save
    end
    respond_to :js
    #redirect_to :controller => 'cis', :action => 'show', :id => params[:id],  
  end

  def gera_novo_impactado
    ci = Ci.find(params[:idci])
    dep = Ci.find_by_chave(params[:inclusao][:impactado]) 
    if dep == nil then
        flash[:error] = "CI: \"#{params[:inclusao][:impactado]}\" nao encontrado"
    else 
        ci.impactados << dep
        ci.save
    end
    respond_to :js
    #redirect_to :controller => 'cis', :action => 'show', :id => params[:id],  
  end
   
  def impactados
     @fila_impactados = gera_relaciomentos(:impactados)
     gera_grafico_relacionamento(params[:id],:impactados)
     @imagem_impactados = true
  end

  def dependentes

     @fila_dependentes = gera_relaciomentos(:dependentes)
     gera_grafico_relacionamento(params[:id],:dependentes)
     @imagem_dependentes = true

  end

  def dependentes_all
     @fila_dependentes = gera_relaciomentos_com_composto_de
     gera_grafico_relacionamento(params[:id],:dependentes_all)
     @imagem_dependentes_all = true
     render :dependentes
  end

   
end