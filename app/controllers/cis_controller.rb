require "queueable"
class CisController < ApplicationController
  include Queueable

  # Variaveis geradas por esse controller
  # @fila_impactados
  # @fila_dependentes
  # @imagem_impactados
  # @imagem_dependentes
  # @ci
  # @atributos
  # @sites
  # @tiposci

  
  def cache(ci)
    session[:oldCI] = ci.id 
    @filaNavegacao = session[:filaNavegacao]
    @filaNavegacao ||= Fila.new
    @filaNavegacao.enfilera(ci.id)
    session[:filaNavegacao] = @filaNavegacao 
  end
 
  def show
    #@ci = Ci.find(params[:id])
    #@atributos = @ci.atributos
    @ci, @atributos = Ci.find_com_atributos(params[:id])
    cache(@ci)
  end
  
  def edit
    # @ci = Ci.find(params[:id])
    # @atributos = @ci.atributos
    @ci, @atributos = Ci.find_com_atributos(params[:id])
    @sites = Site.all
    @tiposci = Tipoci.all
  end
  
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
  
  def update
    @ci = Ci.find(params[:id])


    respond_to do |format|
      if @ci.update_attributes(params[:ci])
         @ci.atributos = params[:atributos]
        format.html { redirect_to @ci, notice: 'Item foi salvo !! ' }
        format.json { head :no_content }
      else
         @sites = Site.all
         @tiposci = Tipoci.all
         @atributos = @ci.atributos
        format.html { render action: "edit" }
        format.json { render json: @ci.errors, status: :unprocessable_entity }
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

    @search = params[:search] || session[:search]
    session[:search] = @search
    session[:oldCI] = nil
    
    begin
      @cis = Ci.search @search, :match_mode => :boolean, :per_page => 20, :page => params[:page]
      @cis.length
      @cis.compact!
    rescue 
      flash[:error] = "Error[DB0001] - Search Engine desligado"
      @cis = Ci.paginate(:page => params[:page])
    end 
    #if @cis.length==1 then 
    #  @ci = @cis[0]
    #  session[:oldCI] = @ci.id
    #  session[:search] = nil # senao nao volta para tela de listagem, pois ao voltar 
    #                         # ele vai entrar novamente no i'm lucky
    #  render :show
    #  return
    #end
    
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
    @sites = Site.all
    @tiposci = Tipoci.all
    @oldci = session[:oldCI]==nil ? nil : Ci.find(session[:oldCI])
  end
  
  def create
      @ci = Ci.new(params[:ci])
      case params[:dependencia]
        when "2"    
          @ci.dependentes << Ci.find(session[:oldCI])
        when "3" 
          @ci.impactados << Ci.find(session[:oldCI])
      end
      
      respond_to do |format|
        if @ci.save          
          format.html { redirect_to(@ci, :notice => 'CI criada com sucesso.') }
        else
          @sites = Site.all
          @tiposci = Tipoci.all
          @oldci = Ci.find(session[:oldCI])
          format.html { render :action => "new" }
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

  def gera_grafico_relacionamento(id,direcao)
    apath =  File.expand_path('../../../public', __FILE__)

    g = GraphViz::new( "G" )

    nodes = Hash.new
    edges_visitado = Hash.new
    nivel_max = 4

    @ci = Ci.find(id)
    init_queue
    enqueue([@ci,0])


    while not queue.empty?
        #retira (e retorna) o primeiro elementro da fila ([impactado, nivel])
        @i,nivel = dequeue
        
        if @i.dataChange and @i.dataChange.to_time >= 5.days.ago then
           nodes[@i.chave] = g.add_nodes(@i.chave, { :label => "#{@i.chave}\n#{@i.dataChange}", :color => "red"})
        else 
           nodes[@i.chave] = g.add_nodes(@i.chave , { :label => "#{@i.chave}\n#{@i.tipoci.tipo}"})
        end

        if nivel <= nivel_max then
          @i.send(direcao).each do |ii|
              #erro ??!?!?! nao testo a data de mudanca ???s\          
              nodes[ii.chave] = g.add_nodes(ii.chave) 
             
              if not edges_visitado[@i.chave+"#"+ii.chave] then   
                g.add_edges(nodes[@i.chave], nodes[ii.chave])
                edges_visitado[@i.chave+"#"+ii.chave] = true
              end
          end    

          # retorna uma matrix com varios elementos (.map)
          # transforma cada elemento impactado num array com [impactado, nivel + 1]
          # concatena essas tuplas de impactados no final da fila

          @i.send(direcao).map { |x| enqueue([x,nivel+1])}
        end
    end

    g.output( :png => apath+"/imagens/#{@ci.chave_sanitizada}-#{direcao}.png" )
  end

  def gera_relaciomentos (direcao)
    
    @ci = Ci.find(params[:id])
    init_queue
    
    enqueue([@ci,0])
    edges_visitado = Hash.new

    nivel_max = 8

    @fila_resultado = []

    while not queue_empty?
      #retira (e retorna) o primeiro elementro da fila ([impactado, nivel])
      i,nivel = dequeue
      if nivel <= nivel_max then
          if not edges_visitado[i.chave] then        
              edges_visitado[i.chave] = true
              @fila_resultado << [:ci,i] unless i.send(direcao).empty?
              i.send(direcao).each do |ii|
                  @fila_resultado << [:subci,ii]
              end
          end    

        # retorna uma matrix com varios elementos (.map)
        # transforma cada elemento impactado numa tupla com [impactado, nivel + 1]
        # concatena essas tuplas de impactados no final da fila

        i.send(direcao).map { |x| enqueue([x,nivel+1])}
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

  def elimina_dependente
    # @customer.orders.delete(@order1)
     ci = Ci.find(params[:idci])
     dep = Ci.find_by_chave(params[:exclusao][:dependente]) 
     if dep == nil || ! ci.dependentes.include?(dep) then
        flash[:error] = "CI: \"#{params[:exclusao][:dependente]}\" nao encontrado ou nao dependente de \"#{ci.chave}\""
     else 
        ci.dependentes.delete(dep)
        ci.save
     end
     respond_to :js
   end

  def elimina_impactado
    # @customer.orders.delete(@order1)
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
     @fila_dependentes = gera_relaciomentos(:dependentes_all)
     gera_grafico_relacionamento(params[:id],:dependentes_all)
     @imagem_dependentes_all = true
     render :dependentes
  end
  
end