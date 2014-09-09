require 'test_helper'

class AreaResponsabilidadesControllerTest < ActionController::TestCase
  setup do
    @area_responsabilidade = area_responsabilidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:area_responsabilidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area_responsabilidade" do
    assert_difference('AreaResponsabilidade.count') do
      post :create, area_responsabilidade: { area: @area_responsabilidade.area, responsaveis: @area_responsabilidade.responsaveis }
    end

    assert_redirected_to area_responsabilidade_path(assigns(:area_responsabilidade))
  end

  test "should show area_responsabilidade" do
    get :show, id: @area_responsabilidade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area_responsabilidade
    assert_response :success
  end

  test "should update area_responsabilidade" do
    put :update, id: @area_responsabilidade, area_responsabilidade: { area: @area_responsabilidade.area, responsaveis: @area_responsabilidade.responsaveis }
    assert_redirected_to area_responsabilidade_path(assigns(:area_responsabilidade))
  end

  test "should destroy area_responsabilidade" do
    assert_difference('AreaResponsabilidade.count', -1) do
      delete :destroy, id: @area_responsabilidade
    end

    assert_redirected_to area_responsabilidades_path
  end
end
