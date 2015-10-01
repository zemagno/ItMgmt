require 'test_helper'

class SoftwaresControllerTest < ActionController::TestCase
  setup do
    @custo_software = custo_softwares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:softwares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custo_software" do
    assert_difference('CustoSoftware.count') do
      post :create, custo_software: { cobrar: @custo_software.cobrar, custoMensal: @custo_software.custoMensal, software: @custo_software.software }
    end

    assert_redirected_to custo_software_path(assigns(:custo_software))
  end

  test "should show custo_software" do
    get :show, id: @custo_software
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custo_software
    assert_response :success
  end

  test "should update custo_software" do
    put :update, id: @custo_software, custo_software: { cobrar: @custo_software.cobrar, custoMensal: @custo_software.custoMensal, software: @custo_software.software }
    assert_redirected_to custo_software_path(assigns(:custo_software))
  end

  test "should destroy custo_software" do
    assert_difference('CustoSoftware.count', -1) do
      delete :destroy, id: @custo_software
    end

    assert_redirected_to custo_softwares_path
  end
end
