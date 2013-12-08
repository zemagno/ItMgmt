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

ActiveRecord::Schema.define(:version => 20131207161627) do

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
    t.string   "nome"
    t.text     "consulta"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "descricao"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chamados", :force => true do |t|
    t.integer  "SubTipoChamado_id"
    t.integer  "StatusChamado_id"
    t.string   "Solicitante"
    t.string   "Userid"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cis", :force => true do |t|
    t.string   "chave"
    t.string   "descricao"
    t.integer  "site_id"
    t.integer  "tipoci_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Owner"
    t.string   "CC"
    t.string   "url"
    t.date     "dataChange"
    t.string   "jira"
    t.string   "obs"
    t.string   "DocChange"
    t.integer  "statusci_id"
    t.integer  "contrato_id"
    t.decimal  "CustoMensal", :precision => 10, :scale => 2
    t.string   "notificacai"
    t.string   "notificacao"
  end

  add_index "cis", ["chave"], :name => "index_cis_on_chave"

  create_table "contratos", :force => true do |t|
    t.string   "codcontrato"
    t.string   "descricao"
    t.decimal  "valormensal",             :precision => 10, :scale => 2
    t.integer  "tipocontrato_id"
    t.integer  "fornecedor_id"
    t.date     "datainicio"
    t.date     "datafim"
    t.date     "datarenovacao"
    t.integer  "indicador_financeiro_id"
    t.string   "projetoCCTI"
    t.string   "projetoCCArea"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "classificacao"
    t.string   "url"
    t.string   "contrato"
  end

  add_index "contratos", ["codcontrato"], :name => "index_contratos_on_codcontrato"

  create_table "criticidades", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dicdados", :force => true do |t|
    t.string   "nome"
    t.integer  "tipoci_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordem"
    t.string   "url"
    t.string   "descricao"
    t.string   "valores"
  end

  add_index "dicdados", ["tipoci_id"], :name => "index_dicdados_on_tipoci_id"


  create_table "fornecedores", :force => true do |t|
    t.string   "nome"
    t.string   "nomecompleto"
    t.string   "cnpj"
    t.string   "endereco"
    t.string   "contatos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "anotacoes"
    t.integer  "areafornecedor_id"
    t.text     "enderecos"
  end

  create_table "indicadores_financeiros", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedidos", :force => true do |t|
    t.string   "requisicao",             :limit => 20
    t.string   "solicitante",            :limit => 40
    t.string   "loginUsuario",           :limit => 20
    t.date     "dataPedido"
    t.date     "dataAutorizacao"
    t.date     "dataSolicitacaoCompras"
    t.date     "dataEntrega"
    t.string   "comprador",              :limit => 20
    t.integer  "site_id"
    t.string   "ativo"
    t.integer  "custoEstimado"
    t.string   "pedidoResumido",         :limit => 40
    t.string   "observacao"
    t.string   "CCUN",                   :limit => 6
    t.string   "projetoUN",              :limit => 30
    t.string   "ccTI",                   :limit => 6
    t.string   "projetoTI",              :limit => 30
    t.integer  "status_pedido_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "sites", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "status_chamados", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  create_table "sub_tipo_chamados", :force => true do |t|
    t.integer  "TipoChamado_id"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.text     "description"
    t.string   "status"
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
  end

  create_table "tipo_chamados", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipocis", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Descricao"
    t.string   "Owner"
  end

  create_table "tipocontratos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipotasks", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "roles"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "view_templates", :force => true do |t|
    t.string   "name"
    t.string   "prefix"
    t.boolean  "partial"
    t.text     "source"
    t.string   "locale"
    t.string   "formats"
    t.string   "handlers"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
