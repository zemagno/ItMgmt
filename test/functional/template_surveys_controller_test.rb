require 'test_helper'

class TemplateSurveysControllerTest < ActionController::TestCase
  setup do
    @template_survey = template_surveys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:template_surveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create template_survey" do
    assert_difference('TemplateSurvey.count') do
      post :create, template_survey: { formulario: @template_survey.formulario, nome: @template_survey.nome }
    end

    assert_redirected_to template_survey_path(assigns(:template_survey))
  end

  test "should show template_survey" do
    get :show, id: @template_survey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @template_survey
    assert_response :success
  end

  test "should update template_survey" do
    put :update, id: @template_survey, template_survey: { formulario: @template_survey.formulario, nome: @template_survey.nome }
    assert_redirected_to template_survey_path(assigns(:template_survey))
  end

  test "should destroy template_survey" do
    assert_difference('TemplateSurvey.count', -1) do
      delete :destroy, id: @template_survey
    end

    assert_redirected_to template_surveys_path
  end
end
