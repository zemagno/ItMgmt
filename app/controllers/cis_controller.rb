
require "queueable"
require "csv"

include ApplicationHelper
class CisController < ApplicationController
  include Queueable
  authorize_resource #cancan
  skip_authorize_resource :only => :index2



  ActionController.add_renderer :csv do |csv, options|
    self.response_body = csv.respond_to?(:to_csv) ? csv.to_csv(options) : csv
  end


  # @layout 'application_novolyaout'

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

  def log
    id = params[:id]
    @ci = Ci.find(id)
    @logs = @ci.log_ci

  end

  def register_log
    data = params[:data]
    id = params[:id]
    log = LogCi.new(ci_id: params[:id], data: params[:data], userid: current_user.login || current_user.name , historico: params[:historico])
    log.save!

    @ci = Ci.find(id)
    @logs = @ci.log_ci

    render :log and return

  end

  def carrega_agregadas
    @sites = Site.all
    @tiposci = Tipoci.all
    @statusci = Statusci.all

    # l =Parametro.get({:tipo => "CI", :subtipo => "FiltroStatus"})
    # a = JSON.parse l
    # a.select { |x| x[0] == "estacao" }[0][1]


  end

  def to_csv (titulo, fields, cis)
    csv_string = CSV.generate do |csv|

      csv << fields[0]
      cis.each do |ci|
        linha = []
        fields[1].each do |f|
          linha << ci.send(f)
        end
        csv << linha
      end
    end
    csv_string

  end


  def cache(ci)
    session[:oldCI] = ci.id
    session[:visao_ci] = @visaoci
  end

  def massiveupdate


    # <% if can? :admin, :all %>
    #    <%= form_tag(cis_massiveupdate_path, :method => "get") do %>

    #   <%= text_field_tag(:massiveupdate, @massiveupdate, :size => 50) %>
    #   <%= submit_tag("Atualizar") %>


    # <% end %>


    # <% end %>

    # render :
    @modo = :confirmar_atualizacao_massiva
    @massiveupdate = params[:massiveupdate]
    index
    render :index and return
  end

  def show
    @ci, @atributos = Ci.find_com_atributos(params[:id])
    # TODO - se nao achar CI, tela de erro


    if @ci
      if ! finalAuth[:view].include? (@ci.tipoci_id)
        flash[:error] = "Voce nao tem autorizacao para ver CI do tipo #{@ci.tipoci.tipo}"
        redirect_to "/cis"

      end
      @search = session[:search_cis]
      cache(@ci)
    else
      flash[:error] = "CI Invalido"
      redirect_to "/cis"
    end
  end

  def edit
    # @ci sendo carregado no filtro..
    @ci, @atributos = Ci.find_com_atributos(params[:id])
    begin
      if @ci
        if ! finalAuth[:edit].include? (@ci.tipoci_id)
          flash[:error] = "Voce nao tem autorizacao para editar CI do tipo #{@ci.tipoci.tipo}"
          render :show
        end
        carrega_agregadas
        begin # se nao tiver parametro com filtro de status, ele mantem todos os status possiveis.
          
          @st = JSON.parse(Parametro.get({:tipo => "CI", :subtipo => "FiltroStatus"})).select { |x| x[0] == @ci.tipoci.tipo }[0][1]
          @statusci.reject! { |s| ! @st.include? s.status }
        rescue
        end
      else
        flash[:error] = "CI Invalido"
        redirect_to "/cis"
      end

    rescue
      flash[:error] = "CI Invalido"
      redirect_to "/cis"
      # TODO tenho que direcionar para pagina de erro.

    end
    #@ci.chave.gsub! '<ID>', @ci.id.to_s
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
    @controller="cis"
    t = Ci.find(@id).nice_tipoci
    @templates_email = TemplatesEmail.find_by_tipo_and_subtipo("CI",t) #  esse metodo ta no Templates e nao pertence ao Rails
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
    template_email =TemplatesEmail.find(params[:template_id])

    if template_email.sync
      @path = "/email/#{template_email.template}/#{params[:id]}"

      respond_to do |format|
        format.js { render :action => '../common/enviar_email_sync.js.erb' }
      end


    else
      p = Hash[:id => params[:id]]
      job = JobEnviarEmail.criar(params[:template_id], p.to_yaml)
      # EnviaEmailWorker.perform_async(job.id)
      #EnviaEmailWorker.perform_in(1.hour,job.id)
      flash[:info] = "INFO: Email enfileirado para envio"
      respond_to do |format|
        format.js {
          render :action => "../common/enviar_email.js.erb"
        }
      end
      # respond_to :js # so para fazer reload da pagina e sumir com
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


  def index2


    @search = params[:search] || session[:search_cis]

    @view_default_ci = params[:view_default_ci] || session[:view_default_ci] || "TI"
    session[:search_cis] = @search
    session[:oldCI] = nil
    session[:view_default_ci] = @view_default_ci

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

    # TODO filtro de tipos aqui...

    # if (@cis.count == 1) && (params[:commit] == "Estou com sorte")
    #   # @ci = @cis[0]
    #   @ci, @atributos = Ci.find_com_atributos(@cis[0].id)
    #   render :show and return
    # end


    #@fields =

    # @fields = [["Descricao","Tipo","Localidade","Gestor","Usuario(s)","Ult ChgMgmt"],[:descricao,:tipo_ci,:nome_localidade,:Owner,:notificacao,:data_ultima_alteracao]]
    @fields = JSON.parse(Parametro.get(:tipo => "views_ci",:subtipo => @view_default_ci))
    @views_ci = Parametro.list(:tipo => "views_ci").map { |i| i[1] }
    @cis.reject! { |c| ! finalAuth[:view].include? (c.tipoci_id) }
    respond_to do |format|
      format.html { render :action => "index" ,:html => @cis }
      format.xml { render :xml => @cis }
      format.csv { render :action => "index" , :csv => to_csv("Cis",@fields,@cis) }
    end
  end

  def index


    @search = params[:search] || session[:search_cis]

    @view_default_ci = params[:view_default_ci] || session[:view_default_ci] || "TI"
    session[:search_cis] = @search
    session[:oldCI] = nil
    session[:view_default_ci] = @view_default_ci

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

    # TODO filtro de tipos aqui...

    # if (@cis.count == 1) && (params[:commit] == "Estou com sorte")
    #   # @ci = @cis[0]
    #   @ci, @atributos = Ci.find_com_atributos(@cis[0].id)
    #   render :show and return
    # end


    #@fields =

    # @fields = [["Descricao","Tipo","Localidade","Gestor","Usuario(s)","Ult ChgMgmt"],[:descricao,:tipo_ci,:nome_localidade,:Owner,:notificacao,:data_ultima_alteracao]]
    @fields = JSON.parse(Parametro.get(:tipo => "views_ci",:subtipo => @view_default_ci))
    @views_ci = Parametro.list(:tipo => "views_ci").map { |i| i[1] }
    @cis.reject! { |c| ! finalAuth[:view].include? (c.tipoci_id) }
    respond_to do |format|
      format.html { render :html => @cis }
      format.json { render :json => @cis }
      format.xml  { render :xml => @cis }
      # format.xml { render :xml => to_xml(params[:id],@campos,@resultado) }
      format.csv { render :csv => to_csv("Cis",@fields,@cis) }
    end
  end


  def new
    @ci = Ci.new
    carrega_agregadas
    @oldci = session[:oldCI]==nil ? nil : Ci.find(session[:oldCI])
  end

  def create
    #  "ci"=>{"chave"=>"mamae"

    @ci = Ci.new(params[:ci])
    case params[:dependencia]
    when "2"
      @ci.dependentes << Ci.find(session[:oldCI])
    when "3"
      @ci.impactados << Ci.find(session[:oldCI])
    end
    respond_to do |format|
      if @ci.save

        # FIXME
        #@ci.limpa_atributos_outros_tipo
        #format.html { redirect_to(@ci, :notice => 'CI criada com sucesso.') }

        format.html {redirect_to(:action => 'edit', :id => @ci.id) }
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
      end
      g.output( :svg => apath+"/imagens/#{@ci.chave_sanitizada}-#{direcao}.svg" )
      Rails.cache.write("#{direcao}-#{@ci.id}-grafico", "Existe",   expires_in: 5.minute)
    end


  end

  def gera_relaciomentos (direcao)
    @ci = Ci.find(params[:id])
    if Rails.cache.exist?("#{direcao}-#{@ci.id}")
      @fila_resultado = JSON.load Rails.cache.read("#{direcao}-#{@ci.id}")
      @email_impactados = Rails.cache.read("#{direcao}-#{@ci.id}-email")
    else
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

        if (not edges_visitado[i.chave]) then
          if nivel <= nivel_max then # aqui tem que entrar todos os filtros

            edges_visitado[i.chave] = true
            @email_impactados << ","+i.Owner unless i.Owner.nil? or i.Owner == "" or nivel>nivel_max_email
            @email_impactados << ","+@ci.notificacao unless @ci.notificacao.nil? or @ci.notificacao == "" or nivel>nivel_max_email

            @fila_resultado << [:ci,i.to_hash] unless i.send(direcao).empty?

            i.send(direcao).each do |ii|
              @fila_resultado << [:subci,ii.to_hash, "Depende de"] unless edges_visitado[ii.chave]
            end
          end

          # retorna uma matrix com varios elementos (.map)
          # transforma cada elemento impactado numa tupla com [impactado, nivel + 1]
          # concatena essas tuplas de impactados no final da fila

          i.send(direcao).map { |x| enqueue([x,nivel+1]) unless edges_visitado[x.chave]}
        end
      end

      @email_impactados = ListaEmail.acerta({listaEmails:@email_impactados,sufixo:"@brq.com"})

      Rails.cache.write("#{direcao}-#{@ci.id}", @fila_resultado.to_json, expires_in: 5.minute)
      Rails.cache.write("#{direcao}-#{@ci.id}-email",@email_impactados,  expires_in: 5.minute)
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
          @fila_resultado << [:ci,i.to_hash] unless i.dependentes.empty?
          i.dependentes.each do |ii|
            @fila_resultado << [:subci,ii.to_hash,"Depende de"]
          end
          i.composto_de.each do |ii|
            @fila_resultado << [:subci,ii.to_hash,"Composto por"]
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
