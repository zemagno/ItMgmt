class FuncionariosController  < InheritedResources::Base
  # actions :index, :edit
  load_and_authorize_resource

  def load_custom_attributes
    # puts "erro0"
    @attrs = []
    begin

      funcionario = Funcionario.find(params[:id])
      funcionario.attribute_names.each do |attr|
        @attrs << [attr,"#{$1}".underscore.humanize,funcionario.attributes[attr]] if attr =~ /^custom(\w+)$/
      end
    rescue
      flash[:error] = "Error[DB0002] - Funcionario nao encontrato"
    end
  end

  def index

    @funcionarios = Funcionario.paginate(:page => params[:page])

  end

  def edit
    load_custom_attributes

  end

  def show
    load_custom_attributes
  end

  def equipe
    f = Funcionario.find_by_Login(params[:id])
    @gestores = f.gestores
    @equipe = f.funcionarios
    @logins = f.funcionarios.map{ |x| x[0]}.join(",")

  end

end
