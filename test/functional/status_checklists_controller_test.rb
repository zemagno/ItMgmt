require 'test_helper'

class StatusChecklistsControllerTest < ActionController::TestCase
  setup do
    @status_checklist = status_checklists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_checklists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_checklist" do
    assert_difference('StatusChecklist.count') do
      post :create, status_checklist: { icon: @status_checklist.icon, status: @status_checklist.status }
    end

    assert_redirected_to status_checklist_path(assigns(:status_checklist))
  end

  test "should show status_checklist" do
    get :show, id: @status_checklist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status_checklist
    assert_response :success
  end

  test "should update status_checklist" do
    put :update, id: @status_checklist, status_checklist: { icon: @status_checklist.icon, status: @status_checklist.status }
    assert_redirected_to status_checklist_path(assigns(:status_checklist))
  end

  test "should destroy status_checklist" do
    assert_difference('StatusChecklist.count', -1) do
      delete :destroy, id: @status_checklist
    end

    assert_redirected_to status_checklists_path
  end
end
