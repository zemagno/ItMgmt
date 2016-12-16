class InventarioController < ApplicationController

  layout 'application_inventario'

  # authorize_resource

  before_action :carrega_agregadas

  def carrega_agregadas

  end

  def index
    @search = params[:search]
    @cis = []
    if ! @search.blank?
      @search_especifico = "#{@search} @tipo=estacao"
      Rails.logger.debug "[DEBUG] Inventario:index. Procurando por #{@search_especifico}"
      @cis = Ci.search @search_especifico, :match_mode => :boolean, :with => { :tipoci_id => finalAuth[:view] }
      @cis.compact!
    end
    session[:search_inventario] = @search
  end

  def show
    @ci = Ci.find(params[:id])
    @func = Funcionario.find_by_Login(@ci.notificacao)
    if @func.nil?
      @login = "N/A"
      @nome =  "N/A"
    else
      @login = @func.Login
      @nome = @func.NomProfissional
    end
    @hostname = @ci._hostname
  end

  def confirma
    Rails.logger.debug "[DEBUG} InventarioControoller:confirma. Params: #{params}"
    respond_to do |format|
      flash[:Info] = "Atualizado !"
      format.html {redirect_to(:action => 'index', :search => session[:search_inventario], :notice => 'Atualizado') }
    end
  end

  def edit
    puts "edit...."
  end

  def create
    puts "create..."
  end

  def update
    puts "Update...."
  end

  def destroy
    puts "destroy...."
  end

  def acao
    Rails.logger.debug "[DEBUG} InventarioControoller:acao. Params: #{params}"

    # TODO - caso de liberar estacao e liberar licencas tem que ser via BRE...
    @ci = Ci.find(params[:id])
    case params[:acao]
      when "Inventariar"
        flash[:Info] = "Estacao a ANALISAR futuramente"
        @ci._inventariado = "ANALISAR"
        @ci.save!
      when "Desalocar"
        flash[:Info] = "Estacao devolvida para estoque!"
        GestaoEstacao.LiberaEstacao(estacao: @ci.chave)     
    end   


    respond_to do |format|
      format.html {redirect_to(:action => 'index', :search => session[:search_inventario], :notice => 'Atualizado') }
    end
  end

end
