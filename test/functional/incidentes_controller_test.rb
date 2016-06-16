require 'test_helper'

class IncidentesControllerTest < ActionController::TestCase
  setup do
    @incidente = incidentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incidentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incidente" do
    assert_difference('Incidente.count') do
      post :create, incidente: { chamados: @incidente.chamados, ci: @incidente.ci, ci_descricao: @incidente.ci_descricao, ci_id: @incidente.ci_id, criticidade: @incidente.criticidade, data_fim_evento: @incidente.data_fim_evento, data_inicio_evento: @incidente.data_inicio_evento, descricao: @incidente.descricao, descricao_solucao: @incidente.descricao_solucao, evento_publico: @incidente.evento_publico, impactados: @incidente.impactados, incidente_tipo_impacto_id: @incidente.incidente_tipo_impacto_id, info_restrita: @incidente.info_restrita, perc_impactados: @incidente.perc_impactados, perda_sla: @incidente.perda_sla, site: @incidente.site, solicitante: @incidente.solicitante, status: @incidente.status, tempo_dentro_sla: @incidente.tempo_dentro_sla, tempo_target_sla: @incidente.tempo_target_sla, tipo_incidente: @incidente.tipo_incidente, total_impactados: @incidente.total_impactados, usuario: @incidente.usuario }
    end

    assert_redirected_to incidente_path(assigns(:incidente))
  end

  test "should show incidente" do
    get :show, id: @incidente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incidente
    assert_response :success
  end

  test "should update incidente" do
    put :update, id: @incidente, incidente: { chamados: @incidente.chamados, ci: @incidente.ci, ci_descricao: @incidente.ci_descricao, ci_id: @incidente.ci_id, criticidade: @incidente.criticidade, data_fim_evento: @incidente.data_fim_evento, data_inicio_evento: @incidente.data_inicio_evento, descricao: @incidente.descricao, descricao_solucao: @incidente.descricao_solucao, evento_publico: @incidente.evento_publico, impactados: @incidente.impactados, incidente_tipo_impacto_id: @incidente.incidente_tipo_impacto_id, info_restrita: @incidente.info_restrita, perc_impactados: @incidente.perc_impactados, perda_sla: @incidente.perda_sla, site: @incidente.site, solicitante: @incidente.solicitante, status: @incidente.status, tempo_dentro_sla: @incidente.tempo_dentro_sla, tempo_target_sla: @incidente.tempo_target_sla, tipo_incidente: @incidente.tipo_incidente, total_impactados: @incidente.total_impactados, usuario: @incidente.usuario }
    assert_redirected_to incidente_path(assigns(:incidente))
  end

  test "should destroy incidente" do
    assert_difference('Incidente.count', -1) do
      delete :destroy, id: @incidente
    end

    assert_redirected_to incidentes_path
  end
end
