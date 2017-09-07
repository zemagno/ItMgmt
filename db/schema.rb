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

ActiveRecord::Schema.define(version: 20170907013311) do

  create_table "HostComKB4019472", id: false, force: :cascade do |t|
    t.integer "Hostname",    limit: 1, null: false
    t.integer "Login",       limit: 1, null: false
    t.integer "Site",        limit: 1, null: false
    t.integer "SO",          limit: 1, null: false
    t.integer "Versao",      limit: 1, null: false
    t.integer "Software",    limit: 1, null: false
    t.integer "DataInstall", limit: 1, null: false
  end

  create_table "HostSemAgentKaspersky", id: false, force: :cascade do |t|
    t.integer "Hostname",      limit: 1, null: false
    t.integer "Usuario",       limit: 1, null: false
    t.integer "OS",            limit: 1, null: false
    t.integer "LastInventory", limit: 1, null: false
    t.integer "Site",          limit: 1, null: false
  end

  create_table "HostnamesSemSophos", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "SO",       limit: 1, null: false
    t.integer "User",     limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
  end

  create_table "HostsComExtraSemInv", id: false, force: :cascade do |t|
    t.integer "hostname",  limit: 1, null: false
    t.integer "descricao", limit: 1, null: false
    t.integer "Software",  limit: 1, null: false
  end

  create_table "HostsComExtraSemLic", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "software", limit: 1, null: false
  end

  create_table "HostsSemInv30dias", id: false, force: :cascade do |t|
    t.integer "name",     limit: 1, null: false
    t.integer "userid",   limit: 1, null: false
    t.integer "TAG",      limit: 1, null: false
    t.integer "lastdate", limit: 1, null: false
  end

  create_table "HostsSemInv60dias", id: false, force: :cascade do |t|
    t.integer "name",     limit: 1, null: false
    t.integer "userid",   limit: 1, null: false
    t.integer "TAG",      limit: 1, null: false
    t.integer "lastdate", limit: 1, null: false
  end

  create_table "HostsSemInv90dias", id: false, force: :cascade do |t|
    t.integer "name",     limit: 1, null: false
    t.integer "userid",   limit: 1, null: false
    t.integer "TAG",      limit: 1, null: false
    t.integer "lastdate", limit: 1, null: false
  end

  create_table "HostsSemKB4019472", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "SO",       limit: 1, null: false
    t.integer "Versao",   limit: 1, null: false
  end

  create_table "MapeamentoLocalTrabalho", id: false, force: :cascade do |t|
    t.string  "NomSite",                limit: 30
    t.string  "NomAndarSite",           limit: 30
    t.string  "NomTipoPosicao",         limit: 30
    t.string  "FlgContabilizaAlocacao", limit: 1
    t.integer "QtdTotalTipoPosicao",    limit: 4
    t.integer "NomPosicaoAndarSite",    limit: 4
    t.integer "FlgReserva",             limit: 4
    t.integer "NumMatrProfissional",    limit: 4
    t.string  "LoginProfissional",      limit: 30
    t.string  "LoginGestor",            limit: 30
  end

  create_table "OCSHostnamesComDoisOffice", id: false, force: :cascade do |t|
    t.integer "hostname",    limit: 1, null: false
    t.integer "Instalacoes", limit: 1, null: false
    t.integer "usuario",     limit: 1, null: false
  end

  create_table "OCSHostnamesComDoisProject", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "count(*)", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
  end

  create_table "OCSHostnamesComDoisVisio", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "count(*)", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
  end

  create_table "OCSHostnamesComOffice", id: false, force: :cascade do |t|
    t.integer "HOSTNAME", limit: 1, null: false
    t.integer "USUARIO",  limit: 1, null: false
    t.integer "SITE",     limit: 1, null: false
    t.integer "SOFTWARE", limit: 1, null: false
  end

  create_table "OCSHostnamesComProject", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "OCSHostnamesComSophos", id: false, force: :cascade do |t|
    t.integer "Hostname",         limit: 1, null: false
    t.integer "Software",         limit: 1, null: false
    t.integer "Versao",           limit: 1, null: false
    t.integer "SO",               limit: 1, null: false
    t.integer "User",             limit: 1, null: false
    t.integer "Site",             limit: 1, null: false
    t.integer "LastInventoryOCS", limit: 1, null: false
  end

  create_table "OCSHostnamesComVisio", id: false, force: :cascade do |t|
    t.integer "HOSTNAME", limit: 1, null: false
    t.integer "LOGIN",    limit: 1, null: false
    t.integer "SITE",     limit: 1, null: false
    t.integer "SOFTWARE", limit: 1, null: false
  end

  create_table "OCSHostsComExtra", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "software", limit: 1, null: false
  end

  create_table "OCSInvHWEstacao", id: false, force: :cascade do |t|
    t.integer "Hostname",      limit: 1, null: false
    t.integer "SerialNumber",  limit: 1, null: false
    t.integer "Login",         limit: 1, null: false
    t.integer "Site",          limit: 1, null: false
    t.integer "OS",            limit: 1, null: false
    t.integer "versao",        limit: 1, null: false
    t.integer "cpu",           limit: 1, null: false
    t.integer "memoria",       limit: 1, null: false
    t.integer "lastinventory", limit: 1, null: false
    t.integer "HD",            limit: 1, null: false
  end

  create_table "OCSInvSWEstacao", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "Software", limit: 1, null: false
    t.integer "OS",       limit: 1, null: false
  end

  create_table "OCSOfficeStandard", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "OCSProjectProfessional", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "OCSProjectStandard", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "OCSSWIntallToday", id: false, force: :cascade do |t|
    t.integer "Hostname",    limit: 1, null: false
    t.integer "Login",       limit: 1, null: false
    t.integer "Site",        limit: 1, null: false
    t.integer "Software",    limit: 1, null: false
    t.integer "DataInstall", limit: 1, null: false
  end

  create_table "OCSVSEnterprise", id: false, force: :cascade do |t|
    t.integer "HOSTNAME", limit: 1, null: false
    t.integer "LOGIN",    limit: 1, null: false
    t.integer "SITE",     limit: 1, null: false
    t.integer "name",     limit: 1, null: false
  end

  create_table "OCSVSPremComOFFPROF", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "OCSVSPremComOFFSTD", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "OCSVSProfEOffProfSemLic", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "OCSVSProfEOffSTDSemLic", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "OCSVSProfessional", id: false, force: :cascade do |t|
    t.integer "HOSTNAME", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "OCSVStudioGeral", id: false, force: :cascade do |t|
    t.integer "HOSTNAME", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "OCSVisioProfessional", id: false, force: :cascade do |t|
    t.integer "HOSTNAME", limit: 1, null: false
    t.integer "LOGIN",    limit: 1, null: false
    t.integer "SITE",     limit: 1, null: false
    t.integer "SOFTWARE", limit: 1, null: false
  end

  create_table "OCSVisioStandard", id: false, force: :cascade do |t|
    t.integer "HOSTNAME", limit: 1, null: false
    t.integer "LOGIN",    limit: 1, null: false
    t.integer "SITE",     limit: 1, null: false
    t.integer "SOFTWARE", limit: 1, null: false
  end

  create_table "OCSVisualStudio", id: false, force: :cascade do |t|
    t.integer "HOSTNAME", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "OCSVsCommunitySemLic", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "software", limit: 1, null: false
  end

  create_table "OCSVsEnterpriseSemLic", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "name",     limit: 1, null: false
  end

  create_table "OCSVsProfSemLic", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "software", limit: 1, null: false
  end

  create_table "OCSVsTeamSemLic", id: false, force: :cascade do |t|
    t.integer "hostname", limit: 1, null: false
    t.integer "software", limit: 1, null: false
  end

  create_table "UserPerDayPerSite", id: false, force: :cascade do |t|
    t.integer "idtusuario",    limit: 1, null: false
    t.integer "dtabatida",     limit: 1, null: false
    t.integer "site",          limit: 1, null: false
    t.integer "TotalPassadas", limit: 1, null: false
  end

  create_table "UsoUnicoSoftware", id: false, force: :cascade do |t|
    t.integer "Login",    limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "ViewEstacoesExcedentes", id: false, force: :cascade do |t|
    t.integer "Usuario",            limit: 1, null: false
    t.integer "Estacoes",           limit: 1, null: false
    t.integer "EstacoesExtras",     limit: 1, null: false
    t.integer "QtdeEstacoesExtras", limit: 1, null: false
  end

  create_table "W10ComKB", id: false, force: :cascade do |t|
    t.integer "Hostname",    limit: 1, null: false
    t.integer "Login",       limit: 1, null: false
    t.integer "Site",        limit: 1, null: false
    t.integer "SO",          limit: 1, null: false
    t.integer "Versao",      limit: 1, null: false
    t.integer "Software",    limit: 1, null: false
    t.integer "DataInstall", limit: 1, null: false
  end

  create_table "W10SemKB", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "SO",       limit: 1, null: false
    t.integer "Versao",   limit: 1, null: false
  end

  create_table "W10SemKB4013429", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "SO",       limit: 1, null: false
    t.integer "Versao",   limit: 1, null: false
  end

  create_table "W7ComKB", id: false, force: :cascade do |t|
    t.integer "Hostname",    limit: 1, null: false
    t.integer "Login",       limit: 1, null: false
    t.integer "Site",        limit: 1, null: false
    t.integer "SO",          limit: 1, null: false
    t.integer "Versao",      limit: 1, null: false
    t.integer "Software",    limit: 1, null: false
    t.integer "DataInstall", limit: 1, null: false
  end

  create_table "W7SemKB", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "SO",       limit: 1, null: false
    t.integer "Versao",   limit: 1, null: false
  end

  create_table "WServer2008ComKB", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "SO",       limit: 1, null: false
    t.integer "Versao",   limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "WServer2008SemKB", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "SO",       limit: 1, null: false
    t.integer "Versao",   limit: 1, null: false
  end

  create_table "WServer2008SemKB4012212", id: false, force: :cascade do |t|
    t.integer "Host",   limit: 1, null: false
    t.integer "SO",     limit: 1, null: false
    t.integer "Versao", limit: 1, null: false
    t.integer "Site",   limit: 1, null: false
    t.integer "Login",  limit: 1, null: false
  end

  create_table "WServer2008SemKB4012215", id: false, force: :cascade do |t|
    t.integer "Host",   limit: 1, null: false
    t.integer "SO",     limit: 1, null: false
    t.integer "Versao", limit: 1, null: false
    t.integer "Site",   limit: 1, null: false
    t.integer "Login",  limit: 1, null: false
  end

  create_table "WServer2012ComKB", id: false, force: :cascade do |t|
    t.integer "Hostname",    limit: 1, null: false
    t.integer "Login",       limit: 1, null: false
    t.integer "Site",        limit: 1, null: false
    t.integer "SO",          limit: 1, null: false
    t.integer "Versao",      limit: 1, null: false
    t.integer "Software",    limit: 1, null: false
    t.integer "DataInstall", limit: 1, null: false
  end

  create_table "WServer2012SemKB", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "SO",       limit: 1, null: false
    t.integer "Versao",   limit: 1, null: false
  end

  create_table "WServer2012SemKB4012213", id: false, force: :cascade do |t|
    t.integer "Host",   limit: 1, null: false
    t.integer "SO",     limit: 1, null: false
    t.integer "Versao", limit: 1, null: false
    t.integer "Site",   limit: 1, null: false
    t.integer "Login",  limit: 1, null: false
  end

  create_table "WServer2012SemKB4012216", id: false, force: :cascade do |t|
    t.integer "Host",   limit: 1, null: false
    t.integer "SO",     limit: 1, null: false
    t.integer "Versao", limit: 1, null: false
    t.integer "Site",   limit: 1, null: false
    t.integer "Login",  limit: 1, null: false
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.text     "body",          limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "namespace",     limit: 255
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id", using: :btree

  create_table "area_de_responsabilidades", force: :cascade do |t|
    t.string   "area",         limit: 255
    t.string   "responsaveis", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "area_responsabilidades", force: :cascade do |t|
    t.string   "area",         limit: 255
    t.string   "responsaveis", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "atributos", force: :cascade do |t|
    t.integer  "ci_id",      limit: 4
    t.integer  "dicdado_id", limit: 4
    t.string   "valor",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "atributos", ["ci_id"], name: "index_atributos_on_ci_id", using: :btree
  add_index "atributos", ["dicdado_id"], name: "dicdado_atributo", using: :btree
  add_index "atributos", ["valor"], name: "valor_atributo", using: :btree

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
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
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

  create_table "cadsurveys", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.text     "formulario", limit: 65535
    t.text     "perguntas",  limit: 65535
    t.text     "respostas",  limit: 65535
    t.boolean  "bloqueado"
    t.boolean  "processado"
    t.string   "chave",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "cadsurveys", ["key"], name: "index_cadsurveys_on_key", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checklist_items", force: :cascade do |t|
    t.integer  "checklist_id",             limit: 4
    t.string   "title",                    limit: 255
    t.text     "description",              limit: 65535
    t.integer  "checklist_item_type",      limit: 4
    t.integer  "period",                   limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "value",                    limit: 4
    t.integer  "parent_checklist_id",      limit: 4
    t.string   "default_executor",         limit: 30
    t.string   "jira_id",                  limit: 50
    t.string   "parent_checklist_jira_id", limit: 50
  end

  add_index "checklist_items", ["checklist_id"], name: "index_checklist_items_on_checklist_id", using: :btree
  add_index "checklist_items", ["parent_checklist_id"], name: "Index_1", using: :btree

  create_table "checklist_itemsNEW", force: :cascade do |t|
    t.integer  "checklist_id",  limit: 4
    t.string   "nome",          limit: 255
    t.string   "herdado_de",    limit: 255
    t.string   "executor",      limit: 255
    t.integer  "tipo",          limit: 4
    t.string   "cisImpactados", limit: 255
    t.date     "dataExecucao"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "checklists", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.text     "description",      limit: 65535
    t.integer  "checklist_type",   limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "ci_key",           limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.string   "state_flag",       limit: 15
    t.string   "jira_id",          limit: 50
    t.string   "default_executor", limit: 255
  end

  create_table "checklistsNEW", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "titulo",     limit: 255
    t.date     "dataInicio"
    t.date     "dataFim"
    t.integer  "status",     limit: 4,     default: 0, null: false
    t.text     "docs",       limit: 65535
    t.string   "lider",      limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.text     "herdados",   limit: 65535
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
    t.string   "codigorateio",      limit: 20
    t.decimal  "CustoMensalCapex",                   precision: 10, scale: 2
    t.decimal  "CustoMensalOpex",                    precision: 10, scale: 2
    t.integer  "tipoCobranca",      limit: 4
    t.integer  "oldStatusci_id",    limit: 4
  end

  add_index "cis", ["Owner"], name: "index_cis_on_Owner", using: :btree
  add_index "cis", ["chave"], name: "index_cis_on_chave", using: :btree
  add_index "cis", ["notificacao"], name: "index_cis_on_notificacao", using: :btree

  create_table "cmdbhostscomextra", id: false, force: :cascade do |t|
    t.string "Usuario",   limit: 255
    t.string "Gestor",    limit: 255
    t.string "chave",     limit: 255
    t.string "descricao", limit: 255
    t.string "Tipo",      limit: 255
    t.string "Hostname",  limit: 255
  end

  create_table "cmdbinvestbrief", id: false, force: :cascade do |t|
    t.string "Patrimonio", limit: 255
    t.string "Hostname",   limit: 255
    t.string "status",     limit: 255
    t.string "Fabricante", limit: 255
    t.string "Modelo",     limit: 255
    t.string "Serial",     limit: 255
  end

  create_table "cmdbofficeprof", id: false, force: :cascade do |t|
    t.string "Hostname", limit: 255
    t.string "software", limit: 255
  end

  create_table "cmdbofficestd", id: false, force: :cascade do |t|
    t.string "Hostname", limit: 255
    t.string "software", limit: 255
  end

  create_table "cmdbprojectprof", id: false, force: :cascade do |t|
    t.string "Hostname", limit: 255
    t.string "software", limit: 255
  end

  create_table "cmdbprojectstd", id: false, force: :cascade do |t|
    t.string "Hostname", limit: 255
    t.string "software", limit: 255
  end

  create_table "cmdbvisioprof", id: false, force: :cascade do |t|
    t.string "Hostname", limit: 255
    t.string "software", limit: 255
  end

  create_table "cmdbvisiostd", id: false, force: :cascade do |t|
    t.string "Hostname", limit: 255
    t.string "software", limit: 255
  end

  create_table "cmdbvisualstudio", id: false, force: :cascade do |t|
    t.string "Hostname", limit: 255
    t.string "software", limit: 255
    t.string "Chave",    limit: 255
    t.string "Login",    limit: 255
  end

  create_table "cobrancamensalestacaoadicional", id: false, force: :cascade do |t|
    t.integer "Usuario",   limit: 1,              null: false
    t.string  "Descricao", limit: 44
    t.integer "Total",     limit: 4,  default: 0, null: false
  end

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
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
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
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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

  create_table "estacaoemestoque", id: false, force: :cascade do |t|
    t.string "CI",       limit: 255
    t.string "Hostname", limit: 255
  end

  create_table "events", force: :cascade do |t|
    t.string   "tipo",       limit: 20
    t.string   "subtipo",    limit: 40
    t.string   "nivel",      limit: 10
    t.text     "valor",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "processado"
  end

  create_table "exec_checklists", force: :cascade do |t|
    t.text     "descricao",           limit: 65535
    t.string   "cis",                 limit: 255
    t.string   "users",               limit: 255
    t.date     "inicioexec"
    t.date     "fimexec"
    t.integer  "tipoci_id",           limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "tickets",             limit: 255
    t.integer  "status_checklist_id", limit: 4
    t.integer  "checklist_id",        limit: 4
    t.string   "alias",               limit: 255
    t.boolean  "abrir_ticket"
    t.string   "titulo",              limit: 255
  end

  add_index "exec_checklists", ["tipoci_id"], name: "index_exec_checklists_on_tipoci_id", using: :btree

  create_table "exec_itens_checklists", force: :cascade do |t|
    t.string   "descricao",           limit: 255
    t.string   "users",               limit: 255
    t.string   "cis",                 limit: 255
    t.integer  "exec_checklist_id",   limit: 4
    t.integer  "status_checklist_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "tickets",             limit: 255
  end

  create_table "fornecedores", force: :cascade do |t|
    t.string   "nome",              limit: 255
    t.string   "nomecompleto",      limit: 255
    t.string   "cnpj",              limit: 255
    t.text     "endereco",          limit: 65535
    t.text     "contatos",          limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "anotacoes",         limit: 65535
    t.integer  "areafornecedor_id", limit: 4
    t.text     "enderecos",         limit: 65535
  end

  create_table "funcbymes", id: false, force: :cascade do |t|
    t.string  "01/2016",  limit: 7, default: "", null: false
    t.integer "count(*)", limit: 8, default: 0,  null: false
  end

  create_table "funcferias", id: false, force: :cascade do |t|
    t.integer "NomProfissional", limit: 1, null: false
    t.integer "Inicio",          limit: 1, null: false
    t.integer "Fim",             limit: 1, null: false
  end

  create_table "funcionarios", primary_key: "Login", force: :cascade do |t|
    t.integer  "NumMatrProfissional",          limit: 4
    t.string   "NomProfissional",              limit: 255
    t.date     "DtaAdmissao"
    t.date     "DtaDemissao"
    t.string   "NomEmailBRQ",                  limit: 50
    t.string   "IdtCPF",                       limit: 20
    t.string   "IdtRG",                        limit: 20
    t.string   "IdtCodigoCentroCusto",         limit: 10
    t.string   "NomCentroCusto",               limit: 255
    t.string   "NomTipoCentroCusto",           limit: 255
    t.string   "IdtCodigoSecao",               limit: 10
    t.string   "NomLocalTrabalho",             limit: 255
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
    t.string   "NomGestorProfissional",        limit: 255
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
    t.boolean  "suspenso"
    t.boolean  "loginBloqueado"
    t.string   "justificativaLoginBloqueado",  limit: 255
    t.date     "DataInicioFerias"
    t.date     "DataFimFerias"
  end

  add_index "funcionarios", ["IdtCPF"], name: "FuncCPF", using: :btree
  add_index "funcionarios", ["NomEmailGestorProfissional"], name: "index_funcionarios_on_NomEmailGestorProfissional", using: :btree
  add_index "funcionarios", ["NomProfissional"], name: "NomProffunc", using: :btree

  create_table "gestores", force: :cascade do |t|
    t.string   "LoginUsuario",     limit: 255
    t.string   "NomeProfissional", limit: 255
    t.string   "LocalTrabalho",    limit: 255
    t.string   "ESTADO",           limit: 255
    t.string   "CIDADE",           limit: 255
    t.integer  "Filial",           limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "grupos", force: :cascade do |t|
    t.string   "nome",         limit: 50
    t.text     "membros",      limit: 16777215
    t.string   "solicitante",  limit: 50
    t.string   "descricao",    limit: 255
    t.date     "dataCriacao"
    t.date     "dataValidade"
    t.string   "chamado",      limit: 50
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "owner",        limit: 255
    t.string   "tipoGrupo",    limit: 255
    t.string   "parametros",   limit: 255
    t.string   "para",         limit: 100
    t.string   "tipo",         limit: 40
  end

  add_index "grupos", ["nome"], name: "index_grupos_on_nome", using: :btree

  create_table "heranca_checklists", force: :cascade do |t|
    t.integer  "pai_id",       limit: 4
    t.integer  "filho_id",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "tipo_heranca", limit: 4
  end

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
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "RMLogin",                     limit: 30
    t.datetime "RMDataAdmissao"
    t.datetime "RMDataDemissao"
    t.string   "RMInterno",                   limit: 30
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
    t.string   "GoogleFlag",                  limit: 10
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
    t.text     "O365GruposEmail",             limit: 65535
    t.string   "ADUAC",                       limit: 20
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
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  create_table "indicadores_financeiros", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invHosts", id: false, force: :cascade do |t|
    t.integer "id_hosts",       limit: 1, null: false
    t.integer "Equipamento",    limit: 1, null: false
    t.integer "Nome",           limit: 1, null: false
    t.integer "Usuario",        limit: 1, null: false
    t.integer "QntLogin",       limit: 1, null: false
    t.integer "Os",             limit: 1, null: false
    t.integer "ProductKey",     limit: 1, null: false
    t.integer "Serial",         limit: 1, null: false
    t.integer "Fabricante",     limit: 1, null: false
    t.integer "DataFab",        limit: 1, null: false
    t.integer "Modelo",         limit: 1, null: false
    t.integer "Processador",    limit: 1, null: false
    t.integer "Memoria",        limit: 1, null: false
    t.integer "HD",             limit: 1, null: false
    t.integer "MACLoc",         limit: 1, null: false
    t.integer "NomeMACLoc",     limit: 1, null: false
    t.integer "MACWi",          limit: 1, null: false
    t.integer "NomeMacWi",      limit: 1, null: false
    t.integer "DataUltimoExec", limit: 1, null: false
    t.integer "Site",           limit: 1, null: false
    t.integer "VidaEmMeses",    limit: 1, null: false
  end

  create_table "inventario_hws", id: false, force: :cascade do |t|
    t.string "source",   limit: 20
    t.string "hostname", limit: 30
  end

  create_table "inventario_kpmg_sw", id: false, force: :cascade do |t|
    t.string "software", limit: 50
    t.string "hostname", limit: 20
  end

  create_table "inventario_kpmg_user", id: false, force: :cascade do |t|
    t.string "hostname", limit: 20
    t.string "login",    limit: 30
  end

  create_table "inventario_sws", force: :cascade do |t|
    t.string   "hostname",   limit: 255
    t.string   "software",   limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "versao",     limit: 4,   default: 0
    t.string   "srcSccm",    limit: 5
    t.string   "srcScript",  limit: 5
    t.string   "srcAuditor", limit: 5
    t.integer  "total",      limit: 4
  end

  add_index "inventario_sws", ["hostname"], name: "index_inventario_sws_on_hostname", using: :btree

  create_table "inventario_sws_0", id: false, force: :cascade do |t|
    t.integer "Id",       limit: 1, null: false
    t.integer "hostname", limit: 1, null: false
    t.integer "software", limit: 1, null: false
  end

  create_table "inventario_user_0", id: false, force: :cascade do |t|
    t.integer "hostname",        limit: 1, null: false
    t.integer "login",           limit: 1, null: false
    t.integer "nomprofissional", limit: 1, null: false
    t.integer "ramal",           limit: 1, null: false
  end

  create_table "inventario_users", force: :cascade do |t|
    t.string   "hostname",   limit: 255
    t.string   "login",      limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "versao",     limit: 4,   default: 0
  end

  add_index "inventario_users", ["hostname"], name: "index_inventario_users_on_hostname", using: :btree
  add_index "inventario_users", ["login"], name: "index_inventario_users_on_login", using: :btree

  create_table "itens_checklists", force: :cascade do |t|
    t.integer  "checklist_id",       limit: 4
    t.string   "descricao",          limit: 255
    t.string   "users",              limit: 255
    t.string   "cis",                limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "TipoAberturaTicket", limit: 20
    t.integer  "tipo_checklist_id",  limit: 4
  end

  add_index "itens_checklists", ["checklist_id"], name: "index_itens_checklists_on_checklist_id", using: :btree

  create_table "iv_facility", id: false, force: :cascade do |t|
    t.integer "extension", limit: 1, null: false
    t.integer "facility",  limit: 1, null: false
    t.integer "value",     limit: 1, null: false
  end

  create_table "job_asyncs", force: :cascade do |t|
    t.string  "tipo",      limit: 255
    t.integer "record_id", limit: 4
    t.text    "params",    limit: 65535
    t.integer "status",    limit: 4,     default: 0, null: false
  end

  create_table "job_enviar_emails", force: :cascade do |t|
    t.integer  "templates_email_id", limit: 4
    t.text     "parametro",          limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "status",             limit: 255
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "job_class",        limit: 255
    t.string   "job_scheduler_id", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "cron",             limit: 255
  end

  create_table "licenciamento_ms_de_paras", force: :cascade do |t|
    t.string   "licencaOrig", limit: 255
    t.string   "licenca",     limit: 255
    t.string   "catLicenca",  limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "log_cis", force: :cascade do |t|
    t.integer  "ci_id",      limit: 4
    t.string   "userid",     limit: 255
    t.datetime "data"
    t.string   "historico",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "log_desligamentos", force: :cascade do |t|
    t.string   "ip",         limit: 255
    t.string   "login",      limit: 255
    t.date     "data"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "mailings", force: :cascade do |t|
    t.string   "tag",                limit: 255
    t.string   "to",                 limit: 255
    t.string   "cc",                 limit: 255
    t.string   "subject",            limit: 255
    t.text     "body",               limit: 65535
    t.integer  "templates_email_id", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
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

  create_table "new_users", force: :cascade do |t|
    t.string   "email",         limit: 255
    t.string   "roles",         limit: 255
    t.text     "auth_token",    limit: 4294967295
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "user_ip",       limit: 255
    t.string   "jira_username", limit: 255
    t.string   "name",          limit: 255
  end

  add_index "new_users", ["email"], name: "email", using: :btree

  create_table "notes", force: :cascade do |t|
    t.text     "notes",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "ocs_OfficeProfessional", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
    t.integer "Software", limit: 1, null: false
  end

  create_table "ocs_hardware", id: false, force: :cascade do |t|
    t.integer "ID",             limit: 1, null: false
    t.integer "DEVICEID",       limit: 1, null: false
    t.integer "NAME",           limit: 1, null: false
    t.integer "WORKGROUP",      limit: 1, null: false
    t.integer "USERDOMAIN",     limit: 1, null: false
    t.integer "OSNAME",         limit: 1, null: false
    t.integer "OSVERSION",      limit: 1, null: false
    t.integer "OSCOMMENTS",     limit: 1, null: false
    t.integer "PROCESSORT",     limit: 1, null: false
    t.integer "PROCESSORS",     limit: 1, null: false
    t.integer "PROCESSORN",     limit: 1, null: false
    t.integer "MEMORY",         limit: 1, null: false
    t.integer "SWAP",           limit: 1, null: false
    t.integer "IPADDR",         limit: 1, null: false
    t.integer "DNS",            limit: 1, null: false
    t.integer "DEFAULTGATEWAY", limit: 1, null: false
    t.integer "ETIME",          limit: 1, null: false
    t.integer "LASTDATE",       limit: 1, null: false
    t.integer "LASTCOME",       limit: 1, null: false
    t.integer "QUALITY",        limit: 1, null: false
    t.integer "FIDELITY",       limit: 1, null: false
    t.integer "USERID",         limit: 1, null: false
    t.integer "TYPE",           limit: 1, null: false
    t.integer "DESCRIPTION",    limit: 1, null: false
    t.integer "WINCOMPANY",     limit: 1, null: false
    t.integer "WINOWNER",       limit: 1, null: false
    t.integer "WINPRODID",      limit: 1, null: false
    t.integer "WINPRODKEY",     limit: 1, null: false
    t.integer "USERAGENT",      limit: 1, null: false
    t.integer "CHECKSUM",       limit: 1, null: false
    t.integer "SSTATE",         limit: 1, null: false
    t.integer "IPSRC",          limit: 1, null: false
    t.integer "UUID",           limit: 1, null: false
    t.integer "ARCH",           limit: 1, null: false
  end

  create_table "ocshostscomkaspersky", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Software", limit: 1, null: false
    t.integer "OS",       limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
  end

  create_table "ocshostssemkaspersky", id: false, force: :cascade do |t|
    t.integer "Hostname",      limit: 1, null: false
    t.integer "Usuario",       limit: 1, null: false
    t.integer "OS",            limit: 1, null: false
    t.integer "LastInventory", limit: 1, null: false
    t.integer "Site",          limit: 1, null: false
  end

  create_table "ocssophosekaspersky", id: false, force: :cascade do |t|
    t.integer "Hostname", limit: 1, null: false
    t.integer "Software", limit: 1, null: false
    t.integer "OS",       limit: 1, null: false
    t.integer "Login",    limit: 1, null: false
    t.integer "Site",     limit: 1, null: false
  end

  create_table "parametros", force: :cascade do |t|
    t.string   "tipo",       limit: 255
    t.string   "subtipo",    limit: 255
    t.text     "valor",      limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipoValor",  limit: 4
  end

  create_table "producao_ads", force: :cascade do |t|
    t.string   "userid",       limit: 255
    t.string   "acao",         limit: 255
    t.string   "parametro",    limit: 255
    t.boolean  "processado"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "cmd",          limit: 255
    t.date     "dataExecucao"
  end

  create_table "producaos", force: :cascade do |t|
    t.string   "job",        limit: 50
    t.string   "status",     limit: 10
    t.datetime "data"
    t.text     "detalhe",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
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
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
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
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "whenHour",   limit: 4
    t.string   "ordem",      limit: 255
  end

  create_table "sipfriends", id: false, force: :cascade do |t|
    t.integer "id",               limit: 1, null: false
    t.integer "name",             limit: 1, null: false
    t.integer "accountcode",      limit: 1, null: false
    t.integer "allow",            limit: 1, null: false
    t.integer "amaflags",         limit: 1, null: false
    t.integer "call-limit",       limit: 1, null: false
    t.integer "callerid",         limit: 1, null: false
    t.integer "callgroup",        limit: 1, null: false
    t.integer "canreinvite",      limit: 1, null: false
    t.integer "context",          limit: 1, null: false
    t.integer "defaultip",        limit: 1, null: false
    t.integer "deny",             limit: 1, null: false
    t.integer "disallow",         limit: 1, null: false
    t.integer "dtmfmode",         limit: 1, null: false
    t.integer "fromdomain",       limit: 1, null: false
    t.integer "fromuser",         limit: 1, null: false
    t.integer "fullcontact",      limit: 1, null: false
    t.integer "host",             limit: 1, null: false
    t.integer "ignoreregexpire",  limit: 1, null: false
    t.integer "insecure",         limit: 1, null: false
    t.integer "ipaddr",           limit: 1, null: false
    t.integer "language",         limit: 1, null: false
    t.integer "mailbox",          limit: 1, null: false
    t.integer "md5secret",        limit: 1, null: false
    t.integer "musiconhold",      limit: 1, null: false
    t.integer "nat",              limit: 1, null: false
    t.integer "permit",           limit: 1, null: false
    t.integer "pickupgroup",      limit: 1, null: false
    t.integer "port",             limit: 1, null: false
    t.integer "progressinband",   limit: 1, null: false
    t.integer "promiscredir",     limit: 1, null: false
    t.integer "qualify",          limit: 1, null: false
    t.integer "regexten",         limit: 1, null: false
    t.integer "regseconds",       limit: 1, null: false
    t.integer "rpid",             limit: 1, null: false
    t.integer "rtpholdtimeout",   limit: 1, null: false
    t.integer "rtptimeout",       limit: 1, null: false
    t.integer "secret",           limit: 1, null: false
    t.integer "sendrpid",         limit: 1, null: false
    t.integer "setvar",           limit: 1, null: false
    t.integer "subscribecontext", limit: 1, null: false
    t.integer "trustrpid",        limit: 1, null: false
    t.integer "type",             limit: 1, null: false
    t.integer "useclientcode",    limit: 1, null: false
    t.integer "username",         limit: 1, null: false
    t.integer "route",            limit: 1, null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "estado",     limit: 2
  end

  create_table "softwares", force: :cascade do |t|
    t.string   "software",    limit: 255
    t.string   "fabricante",  limit: 255
    t.decimal  "custoMensal",             precision: 10
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "status",      limit: 4
  end

  create_table "sql_templates", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.string   "path",       limit: 255
    t.string   "format",     limit: 255
    t.string   "locale",     limit: 255
    t.string   "handler",    limit: 255
    t.boolean  "partial",                  default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "status_checklists", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.string   "icon",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "status_incidentes", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.integer  "ordem",      limit: 4
    t.string   "tipo",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "statuscis", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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

  create_table "template_surveys", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.text     "formulario", limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "templates_emails", force: :cascade do |t|
    t.string   "tipo",       limit: 255
    t.string   "template",   limit: 255
    t.string   "nome",       limit: 255
    t.string   "subtipo",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "tipo_envio", limit: 4
    t.string   "from",       limit: 255
    t.string   "subject",    limit: 255
    t.string   "cc",         limit: 255
  end

  create_table "tipo_chamados", force: :cascade do |t|
    t.string   "descricao",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_checklists", force: :cascade do |t|
    t.string   "tipo",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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

  create_table "tipocontratos", force: :cascade do |t|
    t.string   "descricao",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "usersold", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.string   "name",       limit: 255
    t.string   "roles",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "login",      limit: 255
  end

  create_table "uso_licencas", force: :cascade do |t|
    t.string "Item",         limit: 45
    t.string "Descricao",    limit: 200
    t.string "Software",     limit: 45
    t.string "LoginGestor",  limit: 45
    t.string "Site",         limit: 45
    t.string "LoginUsuario", limit: 45
    t.string "CC",           limit: 45
    t.string "Torre",        limit: 45
    t.string "TipoSoftware", limit: 45
    t.string "CustoAnual",   limit: 45
    t.string "Gestor",       limit: 200
    t.string "Usuario",      limit: 200
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 255,   null: false
    t.integer  "item_id",    limit: 4,     null: false
    t.string   "event",      limit: 255,   null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object",     limit: 65535
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "viewrelatusuariocomvariasestacoes", id: false, force: :cascade do |t|
    t.integer "Usuario",  limit: 1, null: false
    t.integer "Estacoes", limit: 1, null: false
    t.integer "Estado",   limit: 1, null: false
  end

  create_table "vwcargaativosportal", id: false, force: :cascade do |t|
    t.integer "Patrimonio",    limit: 1, null: false
    t.integer "usuario",       limit: 1, null: false
    t.integer "ativo",         limit: 1, null: false
    t.integer "DataEntrega",   limit: 1, null: false
    t.integer "DataDevolucao", limit: 1, null: false
  end

end
