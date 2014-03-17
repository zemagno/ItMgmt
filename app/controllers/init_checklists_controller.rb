class InitChecklistsController < ApplicationController
  def new
    # 
    # InitChecklist é um object que armazenara todos os atributos
    # Sera mostrado num formulario, onde alguns campos são alteraveis
    #TODO no futuro sera possivel crescer os itens, inserinoo nesse momento mais itens
    #
    # ServiceChecklist irá realmente criar a partir do objeto (InitChecklist)
    # 
    @checklist = Checklist.find(params[:checklist_id])
    @itens = @checklist.itens_checklists
    @pais = @checklist.pais
    @init_checklist = InitChecklist.new
    @init_checklist.descricao = @checklist.descricao
    @init_checklist.users = @checklist.users
    @init_checklist.checklist_id = @checklist.id


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @init_checklist }
    end
  end

 
  def create
    @init_checklist = InitChecklist.new(params[:init_checklist])
    # chamar ServiceChecklist (@init_checklist) e devolver id...
    #   
    id = 2 # ServiceChecklist (@init_checklist)  
    puts @init_checklist.to_yaml

    respond_to do |format|
      if @init_checklist.valid?
        
        format.html { redirect_to exec_checklist_url(id) , :action => 'show' , notice: 'Init checklist was successfully created.' }
        
        format.json { render json: @init_checklist, status: :created, location: @init_checklist }
      else
        @checklist = Checklist.find(params[:checklist_id])
        @itens = @checklist.itens_checklists
        @pais = @checklist.pais
        format.html { render action: "new" }
        format.json { render json: @init_checklist.errors, status: :unprocessable_entity }
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
