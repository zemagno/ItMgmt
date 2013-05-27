class TasksController < ApplicationController
  #:autenticacao, :except => [:index, :show] # linha adicionada
  authorize_resource :except => [:index]
  
  layout 'application', :except => :console
    
  def index

    #if can? :manage, @task
         @tasks = Task.ativos
    #else
    #     @tasks = Task.publicas
    #end

    #@tasks = ( can? :manage, @task ? Task.ativos : Task.publicas )

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

  def new
    @task = Task.new
    @authors = Author.all
    @categories = Category.all
    @sites = Site.all
    @criticidades = Criticidade.all
    @fornecedores = Fornecedor.all
  end

  def edit
    @task = Task.find(params[:id])
    @authors = Author.all
    @categories = Category.all
    @sites = Site.all
    @criticidades = Criticidade.all
    @fornecedores = Fornecedor.all
  end
  
  def distribui(subject,task)
    #message = UserMailer.email_alerta("josecarlosmagno@me.com",subject,task)
    #puts message
    #message.deliver
    
  end    

  def create
    @task = Task.new(params[:task])
    @task.Ativo = true;
    respond_to do |format|
      if @task.save
        distribui("Alerta: #{@task.status}",@task)
        format.html { redirect_to(@task, :notice => 'Tarefa criada com sucesso.') }
      else
        flash[:error] = "<ul>" + @task.errors.full_messages.map{|o| "<li>" + o + "</li>" }.join("") + "</ul>"
        
        @authors = Author.all
        @categories = Category.all
        @sites = Site.all
        @criticidades = Criticidade.all
        @task = Task.new(params[:task])
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        distribui("Alerta: #{@task.status} - Alteracao",@task) 
        format.html { redirect_to(@task, :notice => 'Tarefa alterada com sucesso.') }
      else
        flash[:error] = "<ul>" + @task.errors.full_messages.map{|o| "<li>" + o + "</li>" }.join("") + "</ul>"
        @authors = Author.all
        @categories = Category.all
        @sites = Site.all
        @criticidades = Criticidade.all
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