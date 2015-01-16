class InitChecklistsController < ApplicationController


  def carrega_agregadas
    @itens = @checklist.itens_checklists
    @pais = @checklist.pais
    @superpais = @checklist.superpais
  end
  # TODO - colocar seguranca em todo checklist
  def new
    # 
    # InitChecklist é um object que armazenara todos os atributos
    # Sera mostrado num formulario, onde alguns campos são alteraveis
    #  TODO no futuro sera possivel crescer os itens, inserinoo nesse momento mais itens
    #
    # ServiceChecklist irá realmente criar a partir do objeto (InitChecklist)
    # 
    @checklist = Checklist.find(params[:checklist_id])
    carrega_agregadas
    # @itens = @checklist.itens_checklists
    # @pais = @checklist.pais
    # @superpais = @checklist.superpais
    

    #@init_checklist= InitChecklist.new(@checklist.attributes.except("id","created_at","updated_at"))
    # responsavel é o primeiro nome da lista da area_responsaveis.
    #@init_checklist.users = @checklist.responsavel


    @init_checklist = InitChecklist.new
    @init_checklist.descricao = @checklist.descricao
    @init_checklist.titulo = @checklist.titulo
    @init_checklist.alias = @checklist.alias
    @init_checklist.users = @checklist.responsavel
    @init_checklist.checklist_id = @checklist.id
    @init_checklist.abrir_ticket = @checklist.abrir_ticket

    # TODO - criar campos do jira dinamicamente no formulario.
    # esta tudo no @res
    #fields = Parametro.list(:tipo => "Jira Issue Field")
    #@res = []
    #fields.each { |f| @res << [f[1],f[2],retrieve_issuefields_values(JiraCorp,f[2])] } 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @init_checklist }
    end
  end

 
  def create
    @init_checklist = InitChecklist.new(params[:init_checklist])
    puts "params: #{params}"

    flag_erro = true # se tudo der certo, zero flag 

    if @init_checklist.valid?
        svcChecklist = ServiceChecklist.new(@init_checklist)
        id = svcChecklist.IniciarChecklist
        flag_erro = false
    end

    respond_to do |format|
      if not flag_erro
        format.html { redirect_to exec_checklists_url, :action => 'index' , notice: 'Checklist iniciado com sucesso' }   
      else
        @checklist = Checklist.find(params[:checklist_id])
        carrega_agregadas
        # @itens = @checklist.itens_checklists
        # @pais = @checklist.pais
        format.html { render action: "new" }
      end
    end
  end

end
=begin
V.InitChecklist->V.InitChecklist:
C.Checklist->V.Checklist: Show
V.Checklist->+C.InitChecklist: new
C.InitChecklist->+M.Checklist: find
M.Checklist->-C.InitChecklist: @checklist
C.InitChecklist->+M.Checklist: itens_checklists
M.Checklist->-C.InitChecklist: @itens
C.InitChecklist->+M.Checklist: pais
M.Checklist->-C.InitChecklist: @pais
C.InitChecklist->+M.InitChecklist: new
M.InitChecklist->C.InitChecklist: @Init_checklist
C.InitChecklist->M.InitChecklist: <params>
M.InitChecklist->-C.InitChecklist: 

C.InitChecklist->-V.InitChecklist: respond_to::new(@itens_checklist,@itens,@pais)

V.InitChecklist->V.InitChecklist: render(form,pais,itens_)

V.InitChecklist->+C.InitChecklist: create
C.InitChecklist->+M.InitChecklist: new
C.InitChecklist->-M.InitChecklist: valid?


=end
