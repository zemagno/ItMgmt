require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get cis" do
    get :cis
    assert_response :success
  end

end
