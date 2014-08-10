class TasksController < ApplicationController
  authorize_resource :except => [:index]
  
  layout 'application', :except => :console
    

  def carrega_agregados
    @authors = Author.all
    @categories = Category.all
    @sites = Site.all
    @criticidades = Criticidade.all
    @fornecedores = Fornecedor.all
    @status_incidentes = StatusIncidente.all
  end

  def index

    @search_tasks = params[:search] || session[:search_tasks] 
    session[:search_tasks] = @search


    if can? :manage, "tasks"
      if not (@search_tasks == "" or @search_tasks.nil? ) then
        @tasks = Task.search @search_tasks, :match_mode => :boolean #, :per_page => 20, :page => params[:page]
        @tasks.length
        @tasks.compact!
        
      else 
         @tasks = Task.abertas
         @tasksativas = Task.ativas_nao_abertas

      end
    else
         @tasks = Task.publicas
    end

    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  
  end

  def todos
    @tasks = Task.todos
    respond_to do |format|
        format.html { render :index}
        format.xml  { render :xml => @tasks.to_xml(:methods => [:nome_autor, :nome_cliente, :nome_criticidade, :nome_site ]) }
    end
  end

  def show
        @task = Task.find(params[:id])
  end

  def new_from_ci
    @ci = Ci.find(params[:id])
    puts @ci
    @task = Task.new
    carrega_agregados
   
    # new
    @task.site_id = @ci.site_id
    @task.ci_id = @ci.id
    @task.nome = @ci.descricao
    @task.tipotask = "Incidente"
    @task.fornecedor_id = @ci.contrato.fornecedor_id if @ci.contrato
    @task.solicitante = @ci.Owner
    render :new
  end

  def new
    @task = Task.new
    carrega_agregados
  end

  def edit
    @task = Task.find(params[:id])
    carrega_agregados
    #@tipotasks = Tipotask.all
  end
  
  def distribui(task)
    p = Hash[:alerta => task.id]
    #TODO - mudar o 3 para um search (alerta, subtipo)
    job = JobEnviarEmail.criar(3, p.to_yaml)
    EnviaEmailWorker.perform_async(job.id)
    # usar o sidekiq para distribuir email..
    
  end    

  def create
    @task = Task.new(params[:task])
    @task.Ativo = true;
    respond_to do |format|
      if @task.save
        distribui(@task)
        format.html { redirect_to(@task, :notice => 'Alerta criado com sucesso.') }
      else
        flash[:error] = "<ul>" + @task.errors.full_messages.map{|o| "<li>" + o + "</li>" }.join("") + "</ul>"
        
        @authors = Author.all
        @categories = Category.all
        @sites = Site.all
        @criticidades = Criticidade.all
        #@tipotasks = Tipotask.all
        @fornecedores = Fornecedor.all
        @task = Task.new(params[:task])
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        #distribui("Alerta: #{@task.status} - Alteracao",@task) 
        format.html { redirect_to(@task, :notice => 'Tarefa alterada com sucesso.') }
      else
        flash[:error] = "<ul>" + @task.errors.full_messages.map{|o| "<li>" + o + "</li>" }.join("") + "</ul>"
        @authors = Author.all
        @categories = Category.all
        @sites = Site.all
        @criticidades = Criticidade.all
        @fornecedores = Fornecedor.all
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
   
    @task = Task.find(params[:id])
    @task.Ativo = false
    @task.save
    redirect_to :controller => 'tasks', :action => 'index' 
  end
end