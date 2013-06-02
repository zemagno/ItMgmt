require 'test_helper'

class TipotasksControllerTest < ActionController::TestCase
  setup do
    @tipotask = tipotasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipotasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipotask" do
    assert_difference('Tipotask.count') do
      post :create, tipotask: { nome: @tipotask.nome }
    end

    assert_redirected_to tipotask_path(assigns(:tipotask))
  end

  test "should show tipotask" do
    get :show, id: @tipotask
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipotask
    assert_response :success
  end

  test "should update tipotask" do
    put :update, id: @tipotask, tipotask: { nome: @tipotask.nome }
    assert_redirected_to tipotask_path(assigns(:tipotask))
  end

  test "should destroy tipotask" do
    assert_difference('Tipotask.count', -1) do
      delete :destroy, id: @tipotask
    end

    assert_redirected_to tipotasks_path
  end
end
