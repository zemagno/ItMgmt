require 'test_helper'

class TemplatesEmailsControllerTest < ActionController::TestCase
  setup do
    @templates_email = templates_emails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:templates_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create templates_email" do
    assert_difference('TemplatesEmail.count') do
      post :create, templates_email: { nome: @templates_email.nome, subtipo: @templates_email.subtipo, template: @templates_email.template, tipo: @templates_email.tipo }
    end

    assert_redirected_to templates_email_path(assigns(:templates_email))
  end

  test "should show templates_email" do
    get :show, id: @templates_email
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @templates_email
    assert_response :success
  end

  test "should update templates_email" do
    put :update, id: @templates_email, templates_email: { nome: @templates_email.nome, subtipo: @templates_email.subtipo, template: @templates_email.template, tipo: @templates_email.tipo }
    assert_redirected_to templates_email_path(assigns(:templates_email))
  end

  test "should destroy templates_email" do
    assert_difference('TemplatesEmail.count', -1) do
      delete :destroy, id: @templates_email
    end

    assert_redirected_to templates_emails_path
  end
end
