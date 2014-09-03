require 'test_helper'

class AreaDeResponsabilidadesControllerTest < ActionController::TestCase
  setup do
    @area_de_responsabilidade = area_de_responsabilidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:area_de_responsabilidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area_de_responsabilidade" do
    assert_difference('AreaDeResponsabilidade.count') do
      post :create, area_de_responsabilidade: { area: @area_de_responsabilidade.area, responsaveis: @area_de_responsabilidade.responsaveis }
    end

    assert_redirected_to area_de_responsabilidade_path(assigns(:area_de_responsabilidade))
  end

  test "should show area_de_responsabilidade" do
    get :show, id: @area_de_responsabilidade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area_de_responsabilidade
    assert_response :success
  end

  test "should update area_de_responsabilidade" do
    put :update, id: @area_de_responsabilidade, area_de_responsabilidade: { area: @area_de_responsabilidade.area, responsaveis: @area_de_responsabilidade.responsaveis }
    assert_redirected_to area_de_responsabilidade_path(assigns(:area_de_responsabilidade))
  end

  test "should destroy area_de_responsabilidade" do
    assert_difference('AreaDeResponsabilidade.count', -1) do
      delete :destroy, id: @area_de_responsabilidade
    end

    assert_redirected_to area_de_responsabilidades_path
  end
end
