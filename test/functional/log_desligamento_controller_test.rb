require 'test_helper'

class LogDesligamentoControllerTest < ActionController::TestCase
  test "should get ws_register_desligamento" do
    get :ws_register_desligamento
    assert_response :success
  end

end
