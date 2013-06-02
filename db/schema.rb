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

ActiveRecord::Schema.define(:version => 20130528101551) do

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

  create_table "checklists", :force => true do |t|
    t.integer  "evento_id"
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cis", :force => true do |t|
    t.string   "chave"
    t.string   "descricao"
    t.integer  "site_id"
    t.integer  "tipoci_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "CustoMensal"
    t.string   "Campo1"
    t.string   "Campo2"
    t.string   "Campo3"
    t.string   "Campo4"
    t.string   "Owner"
    t.string   "CC"
    t.string   "url"
    t.date     "dataChange"
    t.string   "jira"
    t.string   "obs"
    t.string   "DocChange"
    t.integer  "statusci_id"
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

  create_table "eventos", :force => true do |t|
    t.string   "nome"
    t.date     "dataInicio"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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

  create_table "itens_checklists", :force => true do |t|
    t.integer  "checklist_id"
    t.string   "item"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "notificacaos", :force => true do |t|
    t.string   "evento"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "padrao_checklists", :force => true do |t|
    t.string   "nome"
    t.text     "itens"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.string   "defCampo1"
    t.string   "defCampo2"
    t.string   "defCampo3"
    t.string   "defCampo4"
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
