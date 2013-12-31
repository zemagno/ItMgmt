require 'test_helper'

class InitChecklistsControllerTest < ActionController::TestCase
  setup do
    @init_checklist = init_checklists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:init_checklists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create init_checklist" do
    assert_difference('InitChecklist.count') do
      post :create, init_checklist: { agrupar: @init_checklist.agrupar, checklist_id: @init_checklist.checklist_id, cis: @init_checklist.cis, descricao: @init_checklist.descricao, fimexec: @init_checklist.fimexec, inicioexe: @init_checklist.inicioexe, users: @init_checklist.users }
    end

    assert_redirected_to init_checklist_path(assigns(:init_checklist))
  end

  test "should show init_checklist" do
    get :show, id: @init_checklist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @init_checklist
    assert_response :success
  end

  test "should update init_checklist" do
    put :update, id: @init_checklist, init_checklist: { agrupar: @init_checklist.agrupar, checklist_id: @init_checklist.checklist_id, cis: @init_checklist.cis, descricao: @init_checklist.descricao, fimexec: @init_checklist.fimexec, inicioexe: @init_checklist.inicioexe, users: @init_checklist.users }
    assert_redirected_to init_checklist_path(assigns(:init_checklist))
  end

  test "should destroy init_checklist" do
    assert_difference('InitChecklist.count', -1) do
      delete :destroy, id: @init_checklist
    end

    assert_redirected_to init_checklists_path
  end
end
