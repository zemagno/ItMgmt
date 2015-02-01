require 'test_helper'

class FuncionariosControllerTest < ActionController::TestCase
  setup do
    @funcionario = funcionarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcionarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcionario" do
    assert_difference('Funcionario.count') do
      post :create, funcionario: { CCTorre: @funcionario.CCTorre, CPF: @funcionario.CPF, CodigoCC: @funcionario.CodigoCC, CodigoSecao: @funcionario.CodigoSecao, DataAdmissao: @funcionario.DataAdmissao, DataDemissao: @funcionario.DataDemissao, DescCCTorre: @funcionario.DescCCTorre, Email: @funcionario.Email, Identidade: @funcionario.Identidade, Login: @funcionario.Login, Matricula: @funcionario.Matricula, Nome: @funcionario.Nome, NomeCC: @funcionario.NomeCC, NomeCidadeTrabalho: @funcionario.NomeCidadeTrabalho, NomeLocalTrabalho: @funcionario.NomeLocalTrabalho, NomeTipoCC: @funcionario.NomeTipoCC, OwnerCC: @funcionario.OwnerCC }
    end

    assert_redirected_to funcionario_path(assigns(:funcionario))
  end

  test "should show funcionario" do
    get :show, id: @funcionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcionario
    assert_response :success
  end

  test "should update funcionario" do
    put :update, id: @funcionario, funcionario: { CCTorre: @funcionario.CCTorre, CPF: @funcionario.CPF, CodigoCC: @funcionario.CodigoCC, CodigoSecao: @funcionario.CodigoSecao, DataAdmissao: @funcionario.DataAdmissao, DataDemissao: @funcionario.DataDemissao, DescCCTorre: @funcionario.DescCCTorre, Email: @funcionario.Email, Identidade: @funcionario.Identidade, Login: @funcionario.Login, Matricula: @funcionario.Matricula, Nome: @funcionario.Nome, NomeCC: @funcionario.NomeCC, NomeCidadeTrabalho: @funcionario.NomeCidadeTrabalho, NomeLocalTrabalho: @funcionario.NomeLocalTrabalho, NomeTipoCC: @funcionario.NomeTipoCC, OwnerCC: @funcionario.OwnerCC }
    assert_redirected_to funcionario_path(assigns(:funcionario))
  end

  test "should destroy funcionario" do
    assert_difference('Funcionario.count', -1) do
      delete :destroy, id: @funcionario
    end

    assert_redirected_to funcionarios_path
  end
end
