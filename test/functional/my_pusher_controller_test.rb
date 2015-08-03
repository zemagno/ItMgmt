require 'test_helper'

class MyPusherControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get publica" do
    get :publica
    assert_response :success
  end

end
