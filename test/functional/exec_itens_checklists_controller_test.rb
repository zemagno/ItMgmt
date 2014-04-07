require 'test_helper'

class ExecItensChecklistsControllerTest < ActionController::TestCase
  setup do
    @exec_itens_checklist = exec_itens_checklists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exec_itens_checklists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exec_itens_checklist" do
    assert_difference('ExecItensChecklist.count') do
      post :create, exec_itens_checklist: { cis: @exec_itens_checklist.cis, descricao: @exec_itens_checklist.descricao, gmud: @exec_itens_checklist.gmud, users: @exec_itens_checklist.users }
    end

    assert_redirected_to exec_itens_checklist_path(assigns(:exec_itens_checklist))
  end

  test "should show exec_itens_checklist" do
    get :show, id: @exec_itens_checklist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exec_itens_checklist
    assert_response :success
  end

  test "should update exec_itens_checklist" do
    put :update, id: @exec_itens_checklist, exec_itens_checklist: { cis: @exec_itens_checklist.cis, descricao: @exec_itens_checklist.descricao, gmud: @exec_itens_checklist.gmud, users: @exec_itens_checklist.users }
    assert_redirected_to exec_itens_checklist_path(assigns(:exec_itens_checklist))
  end

  test "should destroy exec_itens_checklist" do
    assert_difference('ExecItensChecklist.count', -1) do
      delete :destroy, id: @exec_itens_checklist
    end

    assert_redirected_to exec_itens_checklists_path
  end
end
