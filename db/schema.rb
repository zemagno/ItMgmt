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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170603152419) do

  create_table "atributos", force: :cascade do |t|
    t.integer  "ci_id",      limit: 4
    t.integer  "dicdado_id", limit: 4
    t.string   "valor",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "atributos", ["ci_id"], name: "index_atributos_on_ci_id", using: :btree

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id",    limit: 4
    t.string   "auditable_type",  limit: 255
    t.integer  "associated_id",   limit: 4
    t.string   "associated_type", limit: 255
    t.integer  "user_id",         limit: 4
    t.string   "user_type",       limit: 255
    t.string   "username",        limit: 255
    t.string   "action",          limit: 255
    t.text     "audited_changes", limit: 65535
    t.integer  "version",         limit: 4,     default: 0
    t.string   "comment",         limit: 255
    t.string   "remote_address",  limit: 255
    t.datetime "created_at"
    t.string   "request_uuid",    limit: 255
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Logon",      limit: 255
  end

  create_table "cadrelatorios", force: :cascade do |t|
    t.string   "nome",          limit: 30
    t.text     "consulta",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descricao",     limit: 255
    t.string   "categoria",     limit: 50
    t.integer  "tipoci_id",     limit: 4
    t.date     "ultimoacesso"
    t.integer  "qtdeacessos",   limit: 4
    t.string   "dashboard",     limit: 255
    t.integer  "ordem",         limit: 4,     default: 0
    t.string   "justificativa", limit: 255
    t.string   "solicitante",   limit: 255
    t.integer  "tipoExibicao",  limit: 4
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cis", force: :cascade do |t|
    t.string   "chave",             limit: 255
    t.string   "descricao",         limit: 255
    t.integer  "site_id",           limit: 4
    t.integer  "tipoci_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Owner",             limit: 255
    t.text     "url",               limit: 16777215
    t.date     "dataChange"
    t.string   "jira",              limit: 255
    t.string   "obs",               limit: 255
    t.string   "DocChange",         limit: 255
    t.integer  "statusci_id",       limit: 4
    t.decimal  "CustoMensal",                        precision: 10, scale: 2
    t.string   "notificacao",       limit: 255
    t.string   "CCDebito",          limit: 20
    t.string   "ProjetoDebito",     limit: 50
    t.string   "CCCredito",         limit: 20
    t.string   "ProjetoCredito",    limit: 50
    t.boolean  "cobrar"
    t.string   "descricaocobranca", limit: 255
    t.boolean  "provisionar"
    t.string   "codigocobranca",    limit: 255
    t.decimal  "CustoMensalCapex",                   precision: 10, scale: 2
    t.decimal  "CustoMensalOpex",                    precision: 10, scale: 2
    t.integer  "tipoCobranca",      limit: 4
    t.integer  "oldStatusci_id",    limit: 4
  end

  add_index "cis", ["Owner"], name: "index_cis_on_Owner", using: :btree
  add_index "cis", ["chave"], name: "index_cis_on_chave", using: :btree
  add_index "cis", ["notificacao"], name: "index_cis_on_notificacao", using: :btree

  create_table "cobrancamensalusosoftware", id: false, force: :cascade do |t|
    t.string  "login",       limit: 255
    t.text    "softwares",   limit: 65535
    t.decimal "customensal",               precision: 32, scale: 2
  end

  create_table "comandos_automacaos", force: :cascade do |t|
    t.string   "comando",    limit: 30
    t.string   "parametro",  limit: 100
    t.text     "resultado",  limit: 65535
    t.integer  "status",     limit: 4
    t.string   "target",     limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "criticidades", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alertacor",  limit: 255
  end

  create_table "custo_softwares", force: :cascade do |t|
    t.string   "software",    limit: 255
    t.string   "fabricante",  limit: 255
    t.decimal  "custoMensal",             precision: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",      limit: 4
  end

  create_table "custom_de_paras", force: :cascade do |t|
    t.string   "de",         limit: 100
    t.string   "para",       limit: 100
    t.string   "tipo",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dicdados", force: :cascade do |t|
    t.string   "nome",        limit: 255
    t.integer  "tipoci_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordem",       limit: 4
    t.string   "url",         limit: 255
    t.string   "descricao",   limit: 255
    t.string   "valores",     limit: 1000
    t.string   "apelido",     limit: 255
    t.string   "tipo",        limit: 255
    t.string   "regex",       limit: 255
    t.boolean  "mandatorio"
    t.text     "tooltip",     limit: 65535
    t.text     "comentarios", limit: 65535
    t.string   "tab",         limit: 255
    t.boolean  "bloqueado"
  end

  add_index "dicdados", ["tipoci_id"], name: "index_dicdados_on_tipoci_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "tipo",       limit: 20
    t.string   "subtipo",    limit: 40
    t.string   "nivel",      limit: 10
    t.text     "valor",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "processado"
  end

  create_table "funcionarios", primary_key: "Login", force: :cascade do |t|
    t.integer  "NumMatrProfissional",          limit: 4
    t.string   "NomProfissional",              limit: 50
    t.date     "DtaAdmissao"
    t.date     "DtaDemissao"
    t.string   "NomEmailBRQ",                  limit: 50
    t.string   "IdtCPF",                       limit: 20
    t.string   "IdtRG",                        limit: 20
    t.string   "IdtCodigoCentroCusto",         limit: 10
    t.string   "NomCentroCusto",               limit: 255
    t.string   "NomTipoCentroCusto",           limit: 255
    t.string   "IdtCodigoSecao",               limit: 10
    t.string   "NomLocalTrabalho",             limit: 50
    t.string   "NomCidadeLocalTrabalho",       limit: 50
    t.string   "IdtCentroCustoTorre",          limit: 10
    t.string   "DscCentroCustoTorre",          limit: 50
    t.string   "NomAlocacao",                  limit: 50
    t.string   "ramal",                        limit: 255
    t.string   "observacao",                   limit: 255
    t.boolean  "semEstacao"
    t.integer  "IdLocalTrabalho",              limit: 4
    t.boolean  "cipa"
    t.boolean  "brigadista"
    t.boolean  "afastado"
    t.date     "DtaRemocaoAcesso"
    t.boolean  "FlgIndicaRetorno"
    t.string   "NomGestorProfissional",        limit: 50
    t.string   "NomEmailGestorProfissional",   limit: 30
    t.string   "NomEstadoLocalTrabalho",       limit: 10
    t.string   "DscCentroCustoBU",             limit: 50
    t.string   "DscCentroCustoExecutivo",      limit: 50
    t.string   "IdtCentroCustoBU",             limit: 30
    t.string   "IdtCentroCustoExecutivo",      limit: 30
    t.string   "NomEmailPessoal",              limit: 50
    t.boolean  "ramalSendoExterno"
    t.datetime "DataInicioAfastamento"
    t.datetime "DataFinalAfastamento"
    t.boolean  "customExternoComOffice365"
    t.string   "justificativaExtComOffice365", limit: 255
    t.boolean  "loginBloqueado"
    t.string   "justificativaLoginBloqueado",  limit: 255
    t.date     "DataInicioFerias"
    t.date     "DataFimFerias"
  end

  add_index "funcionarios", ["IdtCPF"], name: "FuncCPF", using: :btree
  add_index "funcionarios", ["NomEmailGestorProfissional"], name: "index_funcionarios_on_NomEmailGestorProfissional", using: :btree

  create_table "gestores", force: :cascade do |t|
    t.string   "LoginUsuario",     limit: 255
    t.string   "NomeProfissional", limit: 255
    t.string   "LocalTrabalho",    limit: 255
    t.string   "ESTADO",           limit: 255
    t.string   "CIDADE",           limit: 255
    t.integer  "Filial",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grupos", force: :cascade do |t|
    t.string   "nome",         limit: 50
    t.text     "membros",      limit: 16777215
    t.string   "solicitante",  limit: 50
    t.string   "descricao",    limit: 255
    t.date     "dataCriacao"
    t.date     "dataValidade"
    t.string   "chamado",      limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner",        limit: 255
    t.string   "tipoGrupo",    limit: 255
    t.string   "parametros",   limit: 255
  end

  add_index "grupos", ["nome"], name: "index_grupos_on_nome", using: :btree

  create_table "identities", force: :cascade do |t|
    t.string   "login",                       limit: 30
    t.string   "ADUser",                      limit: 30
    t.date     "ADCriadoem"
    t.date     "ADLastLogon"
    t.date     "ADExpiraem"
    t.date     "ADDataDesligamento"
    t.string   "ADUsuarioTipo",               limit: 30
    t.string   "GoogleprimaryEmail",          limit: 30
    t.datetime "GooglelastLoginTime"
    t.string   "GoogleorgUnitPath",           limit: 255
    t.boolean  "Googlesuspended"
    t.string   "GooglesuspensionReason",      limit: 255
    t.string   "GoogleLicenses",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "RMLogin",                     limit: 30
    t.datetime "RMDataAdmissao"
    t.datetime "RMDataDemissao"
    t.string   "ADDN",                        limit: 255
    t.string   "ZMailUser",                   limit: 30
    t.string   "ZMailStatus",                 limit: 255
    t.datetime "ZMailUltimologon"
    t.string   "ZMailRedirect",               limit: 255
    t.string   "ZMailLocalDeliveryDisabled",  limit: 255
    t.string   "ZimbraUser",                  limit: 30
    t.string   "ZimbraStatus",                limit: 255
    t.datetime "ZimbraUltimologon"
    t.string   "ZimbraRedirect",              limit: 255
    t.string   "ZimbraLocalDeliveryDisabled", limit: 255
    t.string   "O365DisplayName",             limit: 50
    t.string   "O365UserPrincipalName",       limit: 50
    t.string   "O365AccountSku",              limit: 50
    t.string   "O365SWAY",                    limit: 50
    t.string   "O365INTUNE_O365",             limit: 50
    t.string   "O365YAMMER_ENTERPRISE",       limit: 50
    t.string   "O365Lync_Online",             limit: 50
    t.string   "O365Sharepoint_Online",       limit: 50
    t.string   "O365Exchange_Online",         limit: 50
    t.text     "ADGrupos",                    limit: 65535
    t.string   "VoIPPermissao",               limit: 255
  end

  add_index "identities", ["ADUser"], name: "index_identities_on_ADUser", using: :btree
  add_index "identities", ["GoogleprimaryEmail"], name: "index_identities_on_GoogleprimaryEmail", using: :btree
  add_index "identities", ["RMLogin"], name: "index_identities_on_RMLogin", using: :btree
  add_index "identities", ["login"], name: "index_identities_on_login", using: :btree

  create_table "incidentes", force: :cascade do |t|
    t.string   "nome",                      limit: 255
    t.text     "descricao",                 limit: 65535
    t.text     "descricao_solucao",         limit: 65535
    t.text     "info_restrita",             limit: 65535
    t.datetime "data_inicio_evento"
    t.datetime "data_fim_evento"
    t.boolean  "evento_publico"
    t.integer  "ci_id",                     limit: 4
    t.string   "tipo_incidente",            limit: 255
    t.string   "status",                    limit: 255
    t.string   "criticidade",               limit: 255
    t.string   "solicitante",               limit: 255
    t.string   "usuario",                   limit: 255
    t.string   "site",                      limit: 255
    t.string   "chamados",                  limit: 255
    t.integer  "tempo_target_sla",          limit: 4
    t.integer  "tempo_dentro_sla",          limit: 4
    t.integer  "impactados",                limit: 4
    t.integer  "total_impactados",          limit: 4
    t.decimal  "perc_impactados",                         precision: 10, scale: 2
    t.integer  "incidente_tipo_impacto_id", limit: 4
    t.decimal  "perda_sla",                               precision: 10, scale: 2
    t.string   "ci",                        limit: 255
    t.string   "ci_descricao",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventario_sws", force: :cascade do |t|
    t.string   "hostname",   limit: 255
    t.string   "software",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "srcSccm",    limit: 5
    t.string   "srcScript",  limit: 5
    t.string   "srcAuditor", limit: 5
    t.integer  "total",      limit: 4
  end

  create_table "job_enviar_emails", force: :cascade do |t|
    t.integer  "templates_email_id", limit: 4
    t.text     "parametro",          limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",             limit: 255
  end

  create_table "log_cis", force: :cascade do |t|
    t.integer  "ci_id",      limit: 4
    t.string   "userid",     limit: 255
    t.datetime "data"
    t.string   "historico",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "log_desligamentos", force: :cascade do |t|
    t.string   "ip",         limit: 255
    t.string   "login",      limit: 255
    t.date     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailings", force: :cascade do |t|
    t.string   "tag",                limit: 255
    t.string   "to",                 limit: 255
    t.string   "cc",                 limit: 255
    t.string   "subject",            limit: 255
    t.text     "body",               limit: 65535
    t.integer  "templates_email_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "from",               limit: 255
  end

  add_index "mailings", ["templates_email_id"], name: "index_mailings_on_templates_email_id", using: :btree

  create_table "mapa_posicaos", id: false, force: :cascade do |t|
    t.string  "NomSite",                limit: 255
    t.string  "NomAndarSite",           limit: 255
    t.string  "NomTipoPosicao",         limit: 255
    t.integer "FlgContabilizaAlocacao", limit: 4
    t.integer "QtdTotalTipoPosicao",    limit: 4
    t.integer "NomPosicaoAndarSite",    limit: 4
    t.integer "FlgReserva",             limit: 4
    t.integer "NumMatrProfissional",    limit: 4
    t.string  "LoginProfissional",      limit: 255
    t.string  "LoginGestor",            limit: 255
  end

  add_index "mapa_posicaos", ["LoginGestor"], name: "index_mapa_posicaos_on_LoginGestor", using: :btree
  add_index "mapa_posicaos", ["LoginProfissional"], name: "index_mapa_posicaos_on_LoginProfissional", using: :btree

  create_table "notes", force: :cascade do |t|
    t.text     "notes",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parametros", force: :cascade do |t|
    t.string   "tipo",       limit: 255
    t.string   "subtipo",    limit: 255
    t.text     "valor",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipoValor",  limit: 4
  end

  create_table "producao_ads", force: :cascade do |t|
    t.string   "userid",       limit: 255
    t.string   "acao",         limit: 255
    t.string   "parametro",    limit: 255
    t.boolean  "processado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cmd",          limit: 255
    t.date     "dataExecucao"
  end

  create_table "producaos", force: :cascade do |t|
    t.string   "job",        limit: 50
    t.string   "status",     limit: 10
    t.datetime "data"
    t.text     "detalhe",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projetos_brqs", force: :cascade do |t|
    t.string   "Projeto",                      limit: 50
    t.string   "IdtCodigoCentroCusto",         limit: 20
    t.string   "NomCentroCusto",               limit: 100
    t.string   "IdtCodigoCentroCustoPai",      limit: 20
    t.string   "NomCentroCustoPai",            limit: 100
    t.string   "NomTipoCentroCusto",           limit: 100
    t.string   "NomProfissionalGestorProjeto", limit: 100
    t.string   "NomTipoOferta",                limit: 100
    t.string   "NomCliente",                   limit: 100
    t.date     "DtaFimPrevistoProjeto"
    t.date     "DtaInicioProjeto"
    t.date     "DthFimProjeto"
    t.string   "NomStatusProjeto",             limit: 100
    t.string   "NomFilial",                    limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "IdtUsuarioGestorCentroCusto",  limit: 255
    t.string   "IdtUsuarioGestorProjeto",      limit: 255
  end

  create_table "relacionamentos", force: :cascade do |t|
    t.integer  "impactado_id",  limit: 4
    t.integer  "dependente_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipo",          limit: 4
  end

  add_index "relacionamentos", ["dependente_id"], name: "index_relacionamentos_on_dependente_id", using: :btree
  add_index "relacionamentos", ["impactado_id"], name: "index_relacionamentos_on_impactado_id", using: :btree

  create_table "schedulers", force: :cascade do |t|
    t.string   "job",        limit: 255
    t.string   "when",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "whenHour",   limit: 4
    t.string   "ordem",      limit: 255
  end

  create_table "sites", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "estado",     limit: 2
  end

  create_table "sql_templates", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.string   "path",       limit: 255
    t.string   "format",     limit: 255
    t.string   "locale",     limit: 255
    t.string   "handler",    limit: 255
    t.boolean  "partial",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "status_incidentes", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.integer  "ordem",      limit: 4
    t.string   "tipo",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuscis", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon",       limit: 255
    t.string   "parametro",  limit: 255
  end

  create_table "tasks", force: :cascade do |t|
    t.text     "description",         limit: 65535
    t.integer  "author_id",           limit: 4
    t.integer  "category_id",         limit: 4
    t.integer  "criticidade_id",      limit: 4
    t.integer  "site_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "Ativo"
    t.datetime "Expiracao"
    t.boolean  "sucesso"
    t.string   "DocChange",           limit: 255
    t.string   "nome",                limit: 255
    t.integer  "fornecedor_id",       limit: 4
    t.string   "chamado",             limit: 255
    t.boolean  "publica"
    t.string   "tipotask",            limit: 255
    t.text     "Descricaorestrita",   limit: 65535
    t.text     "comentario",          limit: 65535
    t.integer  "ci_id",               limit: 4
    t.string   "solicitante",         limit: 255
    t.integer  "status_incidente_id", limit: 4
  end

  create_table "templates_emails", force: :cascade do |t|
    t.string   "tipo",       limit: 255
    t.string   "template",   limit: 255
    t.string   "nome",       limit: 255
    t.string   "subtipo",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipo_envio", limit: 4
    t.string   "from",       limit: 255
    t.string   "subject",    limit: 255
    t.string   "cc",         limit: 255
  end

  create_table "tipocis", force: :cascade do |t|
    t.string   "tipo",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Descricao",  limit: 255
    t.string   "Owner",      limit: 255
    t.string   "perfil",     limit: 255
    t.string   "tab",        limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "roles",                  limit: 255
    t.string   "internal_login",         limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "name",                   limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "confirmation_token",     limit: 255
    t.string   "unconfirmed_email",      limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "viewrelatusuariocomvariasestacoes", id: false, force: :cascade do |t|
    t.string "Usuario",  limit: 255
    t.text   "Estacoes", limit: 65535
    t.string "Estado",   limit: 10
  end

  create_table "vwcargaativosportal", id: false, force: :cascade do |t|
    t.string "Patrimonio",    limit: 255
    t.string "usuario",       limit: 255
    t.text   "ativo",         limit: 65535
    t.string "DataEntrega",   limit: 255
    t.string "DataDevolucao", limit: 255
  end

end
