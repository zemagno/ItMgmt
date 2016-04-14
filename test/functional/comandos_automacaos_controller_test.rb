require 'test_helper'

class ComandosAutomacaosControllerTest < ActionController::TestCase
  setup do
    @comandos_automacao = comandos_automacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comandos_automacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comandos_automacao" do
    assert_difference('ComandosAutomacao.count') do
      post :create, comandos_automacao: { comando: @comandos_automacao.comando, parametro: @comandos_automacao.parametro, resultado: @comandos_automacao.resultado, status: @comandos_automacao.status, target: @comandos_automacao.target }
    end

    assert_redirected_to comandos_automacao_path(assigns(:comandos_automacao))
  end

  test "should show comandos_automacao" do
    get :show, id: @comandos_automacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comandos_automacao
    assert_response :success
  end

  test "should update comandos_automacao" do
    put :update, id: @comandos_automacao, comandos_automacao: { comando: @comandos_automacao.comando, parametro: @comandos_automacao.parametro, resultado: @comandos_automacao.resultado, status: @comandos_automacao.status, target: @comandos_automacao.target }
    assert_redirected_to comandos_automacao_path(assigns(:comandos_automacao))
  end

  test "should destroy comandos_automacao" do
    assert_difference('ComandosAutomacao.count', -1) do
      delete :destroy, id: @comandos_automacao
    end

    assert_redirected_to comandos_automacaos_path
  end
end
