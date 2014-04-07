require 'test_helper'

class ExecChecklistsControllerTest < ActionController::TestCase
  setup do
    @exec_checklist = exec_checklists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exec_checklists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exec_checklist" do
    assert_difference('ExecChecklist.count') do
      post :create, exec_checklist: { cis: @exec_checklist.cis, descricao: @exec_checklist.descricao, fimexec: @exec_checklist.fimexec, gmud: @exec_checklist.gmud, inicioexec: @exec_checklist.inicioexec, users: @exec_checklist.users }
    end

    assert_redirected_to exec_checklist_path(assigns(:exec_checklist))
  end

  test "should show exec_checklist" do
    get :show, id: @exec_checklist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exec_checklist
    assert_response :success
  end

  test "should update exec_checklist" do
    put :update, id: @exec_checklist, exec_checklist: { cis: @exec_checklist.cis, descricao: @exec_checklist.descricao, fimexec: @exec_checklist.fimexec, gmud: @exec_checklist.gmud, inicioexec: @exec_checklist.inicioexec, users: @exec_checklist.users }
    assert_redirected_to exec_checklist_path(assigns(:exec_checklist))
  end

  test "should destroy exec_checklist" do
    assert_difference('ExecChecklist.count', -1) do
      delete :destroy, id: @exec_checklist
    end

    assert_redirected_to exec_checklists_path
  end
end
