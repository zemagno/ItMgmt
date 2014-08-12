require 'test_helper'

class CustomDeParasControllerTest < ActionController::TestCase
  setup do
    @custom_de_para = custom_de_paras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_de_paras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_de_para" do
    assert_difference('CustomDePara.count') do
      post :create, custom_de_para: { de: @custom_de_para.de, para: @custom_de_para.para, tipo: @custom_de_para.tipo }
    end

    assert_redirected_to custom_de_para_path(assigns(:custom_de_para))
  end

  test "should show custom_de_para" do
    get :show, id: @custom_de_para
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_de_para
    assert_response :success
  end

  test "should update custom_de_para" do
    put :update, id: @custom_de_para, custom_de_para: { de: @custom_de_para.de, para: @custom_de_para.para, tipo: @custom_de_para.tipo }
    assert_redirected_to custom_de_para_path(assigns(:custom_de_para))
  end

  test "should destroy custom_de_para" do
    assert_difference('CustomDePara.count', -1) do
      delete :destroy, id: @custom_de_para
    end

    assert_redirected_to custom_de_paras_path
  end
end
