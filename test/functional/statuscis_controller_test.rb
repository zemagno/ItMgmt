require 'test_helper'

class StatuscisControllerTest < ActionController::TestCase
  setup do
    @statusci = statuscis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuscis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statusci" do
    assert_difference('Statusci.count') do
      post :create, statusci: { status: @statusci.status }
    end

    assert_redirected_to statusci_path(assigns(:statusci))
  end

  test "should show statusci" do
    get :show, id: @statusci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @statusci
    assert_response :success
  end

  test "should update statusci" do
    put :update, id: @statusci, statusci: { status: @statusci.status }
    assert_redirected_to statusci_path(assigns(:statusci))
  end

  test "should destroy statusci" do
    assert_difference('Statusci.count', -1) do
      delete :destroy, id: @statusci
    end

    assert_redirected_to statuscis_path
  end
end
