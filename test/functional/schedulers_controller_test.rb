require 'test_helper'

class SchedulersControllerTest < ActionController::TestCase
  setup do
    @scheduler = schedulers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedulers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scheduler" do
    assert_difference('Scheduler.count') do
      post :create, scheduler: { job: @scheduler.job, when: @scheduler.when }
    end

    assert_redirected_to scheduler_path(assigns(:scheduler))
  end

  test "should show scheduler" do
    get :show, id: @scheduler
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scheduler
    assert_response :success
  end

  test "should update scheduler" do
    put :update, id: @scheduler, scheduler: { job: @scheduler.job, when: @scheduler.when }
    assert_redirected_to scheduler_path(assigns(:scheduler))
  end

  test "should destroy scheduler" do
    assert_difference('Scheduler.count', -1) do
      delete :destroy, id: @scheduler
    end

    assert_redirected_to schedulers_path
  end
end
