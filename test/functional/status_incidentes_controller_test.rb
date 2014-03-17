require 'test_helper'

class StatusIncidentesControllerTest < ActionController::TestCase
  setup do
    @status_incidente = status_incidentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_incidentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_incidente" do
    assert_difference('StatusIncidente.count') do
      post :create, status_incidente: { ordem: @status_incidente.ordem, status: @status_incidente.status, tipo: @status_incidente.tipo }
    end

    assert_redirected_to status_incidente_path(assigns(:status_incidente))
  end

  test "should show status_incidente" do
    get :show, id: @status_incidente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status_incidente
    assert_response :success
  end

  test "should update status_incidente" do
    put :update, id: @status_incidente, status_incidente: { ordem: @status_incidente.ordem, status: @status_incidente.status, tipo: @status_incidente.tipo }
    assert_redirected_to status_incidente_path(assigns(:status_incidente))
  end

  test "should destroy status_incidente" do
    assert_difference('StatusIncidente.count', -1) do
      delete :destroy, id: @status_incidente
    end

    assert_redirected_to status_incidentes_path
  end
end
