require 'test_helper'

class CadsurveysControllerTest < ActionController::TestCase
  setup do
    @cadsurvey = cadsurveys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cadsurveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cadsurvey" do
    assert_difference('Cadsurvey.count') do
      post :create, cadsurvey: { bloqueado: @cadsurvey.bloqueado, chave: @cadsurvey.chave, formulario: @cadsurvey.formulario, key: @cadsurvey.key, perguntas: @cadsurvey.perguntas, processado: @cadsurvey.processado, respostas: @cadsurvey.respostas }
    end

    assert_redirected_to cadsurvey_path(assigns(:cadsurvey))
  end

  test "should show cadsurvey" do
    get :show, id: @cadsurvey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cadsurvey
    assert_response :success
  end

  test "should update cadsurvey" do
    put :update, id: @cadsurvey, cadsurvey: { bloqueado: @cadsurvey.bloqueado, chave: @cadsurvey.chave, formulario: @cadsurvey.formulario, key: @cadsurvey.key, perguntas: @cadsurvey.perguntas, processado: @cadsurvey.processado, respostas: @cadsurvey.respostas }
    assert_redirected_to cadsurvey_path(assigns(:cadsurvey))
  end

  test "should destroy cadsurvey" do
    assert_difference('Cadsurvey.count', -1) do
      delete :destroy, id: @cadsurvey
    end

    assert_redirected_to cadsurveys_path
  end
end
