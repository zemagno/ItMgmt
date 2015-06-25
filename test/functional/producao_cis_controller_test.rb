require 'test_helper'

class ProducaoCisControllerTest < ActionController::TestCase
  setup do
    @producao_ci = producao_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:producao_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create producao_ci" do
    assert_difference('ProducaoCi.count') do
      post :create, producao_ci: { ci_id: @producao_ci.ci_id, date: @producao_ci.date, detalhe: @producao_ci.detalhe, job: @producao_ci.job, status: @producao_ci.status }
    end

    assert_redirected_to producao_ci_path(assigns(:producao_ci))
  end

  test "should show producao_ci" do
    get :show, id: @producao_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @producao_ci
    assert_response :success
  end

  test "should update producao_ci" do
    put :update, id: @producao_ci, producao_ci: { ci_id: @producao_ci.ci_id, date: @producao_ci.date, detalhe: @producao_ci.detalhe, job: @producao_ci.job, status: @producao_ci.status }
    assert_redirected_to producao_ci_path(assigns(:producao_ci))
  end

  test "should destroy producao_ci" do
    assert_difference('ProducaoCi.count', -1) do
      delete :destroy, id: @producao_ci
    end

    assert_redirected_to producao_cis_path
  end
end
