# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160529233948) do

  create_table "MapeamentoLocalTrabalho", :id => false, :force => true do |t|
    t.string  "NomSite",                :limit => 30
    t.string  "NomAndarSite",           :limit => 30
    t.string  "NomTipoPosicao",         :limit => 30
    t.string  "FlgContabilizaAlocacao", :limit => 1
    t.integer "QtdTotalTipoPosicao"
    t.integer "NomPosicaoAndarSite"
    t.integer "FlgReserva"
    t.integer "NumMatrProfissional"
    t.string  "LoginProfissional",      :limit => 30
    t.string  "LoginGestor",            :limit => 30
  end

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "area_de_responsabilidades", :force => true do |t|
    t.string   "area"
    t.string   "responsaveis"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "area_responsabilidades", :force => true do |t|
    t.string   "area"
    t.string   "responsaveis"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "areafornecedores", :force => true do |t|
    t.string   "area"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atributos", :force => true do |t|
    t.integer  "ci_id"
    t.integer  "dicdado_id"
    t.string   "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "atributos", ["ci_id"], :name => "index_atributos_on_ci_id"
  add_index "atributos", ["dicdado_id"], :name => "dicdado_atributo"
  add_index "atributos", ["valor"], :name => "valor_atributo"

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Logon"
  end

  create_table "cadrelatorios", :force => true do |t|
    t.string   "nome",         :limit => 30
    t.text     "consulta"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "descricao"
    t.string   "categoria",    :limit => 50
    t.integer  "tipoci_id"
    t.date     "ultimoacesso"
    t.integer  "qtdeacessos"
    t.string   "dashboard"
  end

  create_table "cadsurveys", :force => true do |t|
    t.string   "key"
    t.text     "formulario"
    t.text     "perguntas"
    t.text     "respostas"
    t.boolean  "bloqueado"
    t.boolean  "processado"
    t.string   "chave"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cadsurveys", ["key"], :name => "index_cadsurveys_on_key"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checklists", :force => true do |t|
    t.text     "descricao"
    t.string   "users"
    t.integer  "tipoci_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "tipo_checklist_id"
    t.integer  "area_responsabilidade_id"
    t.string   "alias"
    t.boolean  "abrir_ticket"
    t.string   "titulo"
  end

  add_index "checklists", ["tipoci_id"], :name => "index_checklists_on_tipoci_id"

  create_table "cis", :force => true do |t|
    t.string   "chave"
    t.string   "descricao"
    t.integer  "site_id"
    t.integer  "tipoci_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Owner"
    t.text     "url",               :limit => 16777215
    t.date     "dataChange"
    t.string   "jira"
    t.string   "obs"
    t.string   "DocChange"
    t.integer  "statusci_id"
    t.decimal  "CustoMensal",                           :precision => 10, :scale => 2
    t.string   "notificacao"
    t.string   "CCDebito",          :limit => 20
    t.string   "ProjetoDebito",     :limit => 50
    t.string   "CCCredito",         :limit => 20
    t.string   "ProjetoCredito",    :limit => 50
    t.boolean  "cobrar"
    t.string   "descricaocobranca"
    t.boolean  "provisionar"
    t.string   "codigocobranca"
    t.string   "codigorateio",      :limit => 20
    t.decimal  "CustoMensalCapex",                      :precision => 10, :scale => 2
    t.decimal  "CustoMensalOpex",                       :precision => 10, :scale => 2
    t.integer  "tipoCobranca"
    t.integer  "oldStatusci_id"
  end

  add_index "cis", ["Owner"], :name => "index_cis_on_Owner"
  add_index "cis", ["chave"], :name => "index_cis_on_chave"
  add_index "cis", ["notificacao"], :name => "index_cis_on_notificacao"

  create_table "cobrancamensalusosoftware", :id => false, :force => true do |t|
    t.string  "login"
    t.text    "softwares"
    t.decimal "customensal", :precision => 32, :scale => 2
  end

  create_table "comandos_automacaos", :force => true do |t|
    t.string   "comando",    :limit => 30
    t.string   "parametro",  :limit => 100
    t.text     "resultado"
    t.integer  "status"
    t.string   "target",     :limit => 30
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "criticidades", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alertacor"
  end

  create_table "custom_de_paras", :force => true do |t|
    t.string   "de",         :limit => 100
    t.string   "para",       :limit => 30
    t.string   "tipo",       :limit => 10
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "dicdados", :force => true do |t|
    t.string   "nome"
    t.integer  "tipoci_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordem"
    t.string   "url"
    t.string   "descricao"
    t.string   "valores",     :limit => 1000
    t.string   "apelido"
    t.string   "tipo"
    t.string   "regex"
    t.boolean  "mandatorio"
    t.text     "tooltip"
    t.text     "comentarios"
  end

  add_index "dicdados", ["tipoci_id"], :name => "index_dicdados_on_tipoci_id"

  create_table "email_externos", :force => true do |t|
    t.string   "login"
    t.string   "provedor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "tipo",       :limit => 20
    t.string   "subtipo",    :limit => 40
    t.string   "nivel",      :limit => 10
    t.string   "valor"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.boolean  "processado"
  end

  create_table "exec_checklists", :force => true do |t|
    t.text     "descricao"
    t.string   "cis"
    t.string   "users"
    t.date     "inicioexec"
    t.date     "fimexec"
    t.integer  "tipoci_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "tickets"
    t.integer  "status_checklist_id"
    t.integer  "checklist_id"
    t.string   "alias"
    t.boolean  "abrir_ticket"
    t.string   "titulo"
  end

  add_index "exec_checklists", ["tipoci_id"], :name => "index_exec_checklists_on_tipoci_id"

  create_table "exec_itens_checklists", :force => true do |t|
    t.string   "descricao"
    t.string   "users"
    t.string   "cis"
    t.integer  "exec_checklist_id"
    t.integer  "status_checklist_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "tickets"
  end

  create_table "fornecedores", :force => true do |t|
    t.string   "nome"
    t.string   "nomecompleto"
    t.string   "cnpj"
    t.text     "endereco"
    t.text     "contatos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "anotacoes"
    t.integer  "areafornecedor_id"
    t.text     "enderecos"
  end

  create_table "funcionarios", :primary_key => "Login", :force => true do |t|
    t.integer  "NumMatrProfissional"
    t.string   "NomProfissional"
    t.date     "DtaAdmissao"
    t.date     "DtaDemissao"
    t.string   "NomEmailBRQ",                :limit => 50
    t.string   "IdtCPF",                     :limit => 20
    t.string   "IdtRG",                      :limit => 20
    t.string   "IdtCodigoCentroCusto",       :limit => 10
    t.string   "NomCentroCusto"
    t.string   "NomTipoCentroCusto"
    t.string   "IdtCodigoSecao",             :limit => 10
    t.string   "NomLocalTrabalho"
    t.string   "NomCidadeLocalTrabalho",     :limit => 50
    t.string   "IdtCentroCustoTorre",        :limit => 10
    t.string   "DscCentroCustoTorre",        :limit => 50
    t.string   "NomAlocacao",                :limit => 50
    t.string   "ramal"
    t.string   "observacao"
    t.boolean  "semEstacao"
    t.integer  "IdLocalTrabalho"
    t.boolean  "cipa"
    t.boolean  "brigadista"
    t.boolean  "afastado"
    t.date     "DtaRemocaoAcesso"
    t.boolean  "FlgIndicaRetorno"
    t.string   "NomGestorProfissional"
    t.string   "NomEmailGestorProfissional", :limit => 30
    t.string   "NomEstadoLocalTrabalho",     :limit => 10
    t.string   "DscCentroCustoBU",           :limit => 30
    t.string   "DscCentroCustoExecutivo",    :limit => 50
    t.string   "IdtCentroCustoBU",           :limit => 30
    t.string   "IdtCentroCustoExecutivo",    :limit => 30
    t.string   "NomEmailPessoal",            :limit => 50
    t.boolean  "ramalSendoExterno"
    t.datetime "DataInicioAfastamento"
    t.datetime "DataFinalAfastamento"
    t.boolean  "customPossuiVariasEstacoes"
    t.boolean  "customExternoComOffice365"
  end

  add_index "funcionarios", ["NomEmailGestorProfissional"], :name => "index_funcionarios_on_NomEmailGestorProfissional"
  add_index "funcionarios", ["NomProfissional"], :name => "NomProffunc"

  create_table "grupos", :force => true do |t|
    t.string   "nome",         :limit => 50
    t.text     "membros",      :limit => 16777215
    t.string   "solicitante",  :limit => 50
    t.string   "descricao"
    t.date     "dataCriacao"
    t.date     "dataValidade"
    t.string   "chamado",      :limit => 50
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "owner"
    t.string   "tipoGrupo"
    t.string   "parametros"
  end

  add_index "grupos", ["nome"], :name => "index_grupos_on_nome"

  create_table "heranca_checklists", :force => true do |t|
    t.integer  "pai_id"
    t.integer  "filho_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "tipo_heranca"
  end

  create_table "identities", :force => true do |t|
    t.string   "login",                       :limit => 30
    t.string   "ADUser",                      :limit => 30
    t.date     "ADCriadoem"
    t.date     "ADLastLogon"
    t.date     "ADExpiraem"
    t.date     "ADDataDesligamento"
    t.string   "ADUsuarioTipo",               :limit => 30
    t.string   "GoogleprimaryEmail",          :limit => 30
    t.datetime "GooglelastLoginTime"
    t.string   "GoogleorgUnitPath"
    t.boolean  "Googlesuspended"
    t.string   "GooglesuspensionReason"
    t.string   "GoogleLicenses"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "RMLogin",                     :limit => 30
    t.datetime "RMDataAdmissao"
    t.datetime "RMDataDemissao"
    t.string   "RMInterno",                   :limit => 30
    t.string   "ADDN"
    t.string   "ZMailUser",                   :limit => 30
    t.string   "ZMailStatus"
    t.datetime "ZMailUltimologon"
    t.string   "ZMailRedirect"
    t.string   "ZMailLocalDeliveryDisabled"
    t.string   "ZimbraUser",                  :limit => 30
    t.string   "ZimbraStatus"
    t.datetime "ZimbraUltimologon"
    t.string   "ZimbraRedirect"
    t.string   "ZimbraLocalDeliveryDisabled"
    t.string   "GoogleFlag",                  :limit => 10
    t.string   "O365DisplayName",             :limit => 50
    t.string   "O365UserPrincipalName",       :limit => 50
    t.string   "O365AccountSku",              :limit => 50
    t.string   "O365SWAY",                    :limit => 50
    t.string   "O365INTUNE_O365",             :limit => 50
    t.string   "O365YAMMER_ENTERPRISE",       :limit => 50
    t.string   "O365Lync_Online",             :limit => 50
    t.string   "O365Sharepoint_Online",       :limit => 50
    t.string   "O365Exchange_Online",         :limit => 50
    t.text     "ADGrupos"
  end

  add_index "identities", ["ADUser"], :name => "index_identities_on_ADUser"
  add_index "identities", ["GoogleprimaryEmail"], :name => "index_identities_on_GoogleprimaryEmail"
  add_index "identities", ["RMLogin"], :name => "index_identities_on_RMLogin"
  add_index "identities", ["login"], :name => "index_identities_on_login"

  create_table "indicadores_financeiros", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventario_hws", :id => false, :force => true do |t|
    t.string "source",   :limit => 20
    t.string "hostname", :limit => 30
  end

  create_table "inventario_kpmg_sw", :id => false, :force => true do |t|
    t.string "software", :limit => 50
    t.string "hostname", :limit => 20
  end

  create_table "inventario_kpmg_user", :id => false, :force => true do |t|
    t.string "hostname", :limit => 20
    t.string "login",    :limit => 30
  end

  create_table "inventario_sws", :force => true do |t|
    t.string   "hostname"
    t.string   "software"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "versao",                  :default => 0
    t.string   "srcSccm",    :limit => 5
    t.string   "srcScript",  :limit => 5
    t.string   "srcAuditor", :limit => 5
    t.integer  "total"
  end

  add_index "inventario_sws", ["hostname"], :name => "index_inventario_sws_on_hostname"

  create_table "inventario_sws_0", :id => false, :force => true do |t|
    t.integer "Id",       :default => 0, :null => false
    t.string  "hostname"
    t.string  "software"
  end

  create_table "inventario_user_0", :id => false, :force => true do |t|
    t.string "hostname"
    t.string "login"
    t.string "nomprofissional"
    t.string "ramal"
  end

  create_table "inventario_users", :force => true do |t|
    t.string   "hostname"
    t.string   "login"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "versao",     :default => 0
  end

  add_index "inventario_users", ["hostname"], :name => "index_inventario_users_on_hostname"
  add_index "inventario_users", ["login"], :name => "index_inventario_users_on_login"

  create_table "itens_checklists", :force => true do |t|
    t.integer  "checklist_id"
    t.string   "descricao"
    t.string   "users"
    t.string   "cis"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "TipoAberturaTicket", :limit => 20
    t.integer  "tipo_checklist_id"
  end

  add_index "itens_checklists", ["checklist_id"], :name => "index_itens_checklists_on_checklist_id"

  create_table "job_enviar_emails", :force => true do |t|
    t.integer  "templates_email_id"
    t.text     "parametro"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "status"
  end

  create_table "jobs", :force => true do |t|
    t.string   "job_class"
    t.string   "job_scheduler_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "cron"
  end

  create_table "licenciamento_ms_de_paras", :force => true do |t|
    t.string   "licencaOrig"
    t.string   "licenca"
    t.string   "catLicenca"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "log_desligamentos", :force => true do |t|
    t.string   "ip"
    t.string   "login"
    t.date     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mailings", :force => true do |t|
    t.string   "tag"
    t.string   "to"
    t.string   "cc"
    t.string   "subject"
    t.text     "body"
    t.integer  "templates_email_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "from"
  end

  add_index "mailings", ["templates_email_id"], :name => "index_mailings_on_templates_email_id"

  create_table "mapa_posicaos", :id => false, :force => true do |t|
    t.string  "NomSite"
    t.string  "NomAndarSite"
    t.string  "NomTipoPosicao"
    t.integer "FlgContabilizaAlocacao"
    t.integer "QtdTotalTipoPosicao"
    t.integer "NomPosicaoAndarSite"
    t.integer "FlgReserva"
    t.integer "NumMatrProfissional"
    t.string  "LoginProfissional"
    t.string  "LoginGestor"
  end

  add_index "mapa_posicaos", ["LoginGestor"], :name => "index_mapa_posicaos_on_LoginGestor"
  add_index "mapa_posicaos", ["LoginProfissional"], :name => "index_mapa_posicaos_on_LoginProfissional"

  create_table "notes", :force => true do |t|
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notificacaos", :force => true do |t|
    t.string   "evento"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "parametros", :force => true do |t|
    t.string   "tipo"
    t.string   "subtipo"
    t.text     "valor",      :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "producao_ads", :force => true do |t|
    t.string   "userid"
    t.string   "acao"
    t.string   "parametro"
    t.boolean  "processado"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "cmd"
    t.date     "dataExecucao"
  end

  create_table "producao_cis", :force => true do |t|
    t.string   "job",        :limit => 30
    t.integer  "ci_id"
    t.string   "status",     :limit => 10
    t.datetime "date"
    t.string   "detalhe"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "producaos", :force => true do |t|
    t.string   "job",        :limit => 50
    t.string   "status",     :limit => 10
    t.datetime "data"
    t.text     "detalhe"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "relacionamentos", :force => true do |t|
    t.integer  "impactado_id"
    t.integer  "dependente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipo"
  end

  add_index "relacionamentos", ["dependente_id"], :name => "index_relacionamentos_on_dependente_id"
  add_index "relacionamentos", ["impactado_id"], :name => "index_relacionamentos_on_impactado_id"

  create_table "schedulers", :force => true do |t|
    t.string   "job"
    t.string   "when"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "whenHour"
    t.string   "ordem"
  end

  create_table "sites", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "estado",     :limit => 2
  end

  create_table "snippets", :force => true do |t|
    t.string   "language"
    t.string   "plain_code"
    t.string   "highlighted_code"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "softwares", :force => true do |t|
    t.string   "software"
    t.string   "fabricante"
    t.decimal  "custoMensal", :precision => 10, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "status"
  end

  create_table "sql_templates", :force => true do |t|
    t.text     "body"
    t.string   "path"
    t.string   "format"
    t.string   "locale"
    t.string   "handler"
    t.boolean  "partial",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "status_chamados", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "status_checklists", :force => true do |t|
    t.string   "status"
    t.string   "icon"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "status_incidentes", :force => true do |t|
    t.string   "status"
    t.integer  "ordem"
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "status_pedidos", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuscis", :force => true do |t|
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "icon"
    t.string   "parametro"
  end

  create_table "surveys", :force => true do |t|
    t.string   "key"
    t.text     "formulario"
    t.text     "perguntas"
    t.text     "respostas"
    t.boolean  "bloqueado"
    t.boolean  "processado"
    t.string   "chave"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.text     "description"
    t.integer  "author_id"
    t.integer  "category_id"
    t.integer  "criticidade_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "Ativo"
    t.boolean  "sucesso"
    t.string   "DocChange"
    t.string   "nome"
    t.integer  "fornecedor_id"
    t.string   "chamado"
    t.boolean  "publica"
    t.string   "tipotask"
    t.text     "Descricaorestrita"
    t.text     "comentario"
    t.integer  "ci_id"
    t.string   "solicitante"
    t.integer  "status_incidente_id"
  end

  create_table "temp", :id => false, :force => true do |t|
    t.string "f1"
  end

  create_table "temp1", :id => false, :force => true do |t|
    t.integer "id"
  end

  create_table "template_surveys", :force => true do |t|
    t.string   "nome"
    t.text     "formulario"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "templates_emails", :force => true do |t|
    t.string   "tipo"
    t.string   "template"
    t.string   "nome"
    t.string   "subtipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "sync"
  end

  create_table "tipo_chamados", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_checklists", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipocis", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Descricao"
    t.string   "Owner"
    t.string   "perfil"
  end

  create_table "tipocontratos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "roles"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "login"
  end

  create_table "uso_licencas", :force => true do |t|
    t.string "Item",         :limit => 45
    t.string "Descricao",    :limit => 200
    t.string "Software",     :limit => 45
    t.string "LoginGestor",  :limit => 45
    t.string "Site",         :limit => 45
    t.string "LoginUsuario", :limit => 45
    t.string "CC",           :limit => 45
    t.string "Torre",        :limit => 45
    t.string "TipoSoftware", :limit => 45
    t.string "CustoAnual",   :limit => 45
    t.string "Gestor",       :limit => 200
    t.string "Usuario",      :limit => 200
  end

  create_table "usounicosoftware", :id => false, :force => true do |t|
    t.string "Login"
    t.string "Software"
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

