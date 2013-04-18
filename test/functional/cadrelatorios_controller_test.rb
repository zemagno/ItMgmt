require 'test_helper'

class CadrelatoriosControllerTest < ActionController::TestCase
  setup do
    @cadrelatorio = cadrelatorios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cadrelatorios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cadrelatorio" do
    assert_difference('Cadrelatorio.count') do
      post :create, cadrelatorio: { consulta: @cadrelatorio.consulta, nome: @cadrelatorio.nome }
    end

    assert_redirected_to cadrelatorio_path(assigns(:cadrelatorio))
  end

  test "should show cadrelatorio" do
    get :show, id: @cadrelatorio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cadrelatorio
    assert_response :success
  end

  test "should update cadrelatorio" do
    put :update, id: @cadrelatorio, cadrelatorio: { consulta: @cadrelatorio.consulta, nome: @cadrelatorio.nome }
    assert_redirected_to cadrelatorio_path(assigns(:cadrelatorio))
  end

  test "should destroy cadrelatorio" do
    assert_difference('Cadrelatorio.count', -1) do
      delete :destroy, id: @cadrelatorio
    end

    assert_redirected_to cadrelatorios_path
  end
end
