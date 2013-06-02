require 'test_helper'

class TipoTasksControllerTest < ActionController::TestCase
  setup do
    @tipo_task = tipo_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_task" do
    assert_difference('TipoTask.count') do
      post :create, tipo_task: { nome: @tipo_task.nome }
    end

    assert_redirected_to tipo_task_path(assigns(:tipo_task))
  end

  test "should show tipo_task" do
    get :show, id: @tipo_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_task
    assert_response :success
  end

  test "should update tipo_task" do
    put :update, id: @tipo_task, tipo_task: { nome: @tipo_task.nome }
    assert_redirected_to tipo_task_path(assigns(:tipo_task))
  end

  test "should destroy tipo_task" do
    assert_difference('TipoTask.count', -1) do
      delete :destroy, id: @tipo_task
    end

    assert_redirected_to tipo_tasks_path
  end
end
