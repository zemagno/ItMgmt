class FuncionariosController  < InheritedResources::Base
  # actions :index, :edit
  load_and_authorize_resource
  before_filter :authenticate_user!

  def load_custom_attributes
    puts "FuncionariosController::load_custom_attributes"
    @attrs = []
    begin
      @funcionario = Funcionario.find(params[:id])
      @funcionario.attribute_names.each do |attr|
        @attrs << [attr,"#{$1}".underscore.humanize,@funcionario.attributes[attr]] if attr =~ /^custom(\w+)$/
      end
    rescue => error
      puts error.backtrace
      flash[:error] = "Error[DB0002] - Funcionario nao encontrado"
    end
    puts "Func: ==> #{@funcionario}"
  end

  def index
    puts "FuncionariosController::index"
    @funcionarios = Funcionario.paginate(:page => params[:page])

  end

  def edit
    load_custom_attributes

  end

  def show
    puts "FuncionariosController::Show"

    load_custom_attributes
  end

  def equipe
    puts "FuncionariosController::equipe"
    f = Funcionario.find_by_Login(params[:id])
    @funcionario = f
    @gestores = f.gestores
    @equipe = f.funcionarios
    @logins = f.funcionarios.map{ |x| x[0]}.join(",")

  end

end
