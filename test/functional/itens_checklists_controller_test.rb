require 'test_helper'

class ItensChecklistsControllerTest < ActionController::TestCase
  setup do
    @itens_checklist = itens_checklists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itens_checklists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itens_checklist" do
    assert_difference('ItensChecklist.count') do
      post :create, itens_checklist: { cis: @itens_checklist.cis, descricao: @itens_checklist.descricao, users: @itens_checklist.users }
    end

    assert_redirected_to itens_checklist_path(assigns(:itens_checklist))
  end

  test "should show itens_checklist" do
    get :show, id: @itens_checklist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itens_checklist
    assert_response :success
  end

  test "should update itens_checklist" do
    put :update, id: @itens_checklist, itens_checklist: { cis: @itens_checklist.cis, descricao: @itens_checklist.descricao, users: @itens_checklist.users }
    assert_redirected_to itens_checklist_path(assigns(:itens_checklist))
  end

  test "should destroy itens_checklist" do
    assert_difference('ItensChecklist.count', -1) do
      delete :destroy, id: @itens_checklist
    end

    assert_redirected_to itens_checklists_path
  end
end
