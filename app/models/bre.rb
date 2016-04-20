class Bre

  def initialize
    @bre = Hash.new
  end

  def self.instance
    @instance ||= new
  end

  def incluir(_whom,_obj)
    puts "BRE:  Incluir: [#{_whom}]  #{_obj.class.name} #{_obj} #{_obj.tipo}"
  end

  def criarEmailExterno(_obj)
    ComandosAutomacao.create(:comando => "CriarEmailExterno", :target => "LINUX", :parametro => "#{_obj.chave},#{_obj.descricao}", :status => 0 )
  end


  def abrir_alerta(_whom,_obj)
    puts "BRE:  abrir alerta: [#{_whom}]  #{_obj.class.name} #{_obj} #{_obj.tipo}"
  end

  def mudarStatusEstacao(_whom,_obj)
    puts "BRE:  mudarStatusStacao: [#{_whom}]  #{_obj.class.name} #{_obj} "
  end

  def abrirJira(_tipo,_subject,_obj)
    puts "BRE:  abrir Jira: [#{_tipo}] #{_subject} #{_obj.class.name} #{_obj} "
  end

  def criar(_whom,_obj)
    puts "BRE:  criar: [#{_whom}]  #{_obj.class.name} #{_obj} #{_obj.tipoci.tipo}"
  end

  def adicionaGrupo(_whom,_obj)
      puts "adicionaGrupo #{_whom}"
      Grupo.addMembro(_whom,_obj.Login) if _obj.is_a? Funcionario
      Grupo.addMembro(_whom,_obj.notificacao) if _obj.is_a? Ci
  end

  def liberarLicencas(_obj)
    puts "BRE:  liberarLicencas: #{_obj.class.name} #{_obj} "
  end


  # notificar "noc",  "Criacao de Terceiro", terceiro
  def notificar(_whom,_oque,_obj)
    puts "BRE:  Notificar alerta2: [#{_whom}] #{_obj} #{_obj.class.name} #{_obj}"
    # esse notificar so aceita CI"
    p = Hash[ :to => "zemagno@gmail.com", :cc => "", :subject => "Notificacao: #{_oque}", :from => "zemagno@gmail.com", :body => "Notificacao:; #{_oque}; #{_obj.chave}; #{_obj.descricao}"  ]
    job = JobEnviarEmail.criar(79, p.to_yaml)
    # TODO hardcoded...
    puts "  Notificar alerta2: [#{_whom}] #{_obj} #{_obj.class.name} #{_obj}"
  end

  def quando(_action, _target, _domain, &block)
    # puts "BRE:armazenando block #{_action}:#{_target}:#{_domain}"
    @bre["#{_action}:#{_target}:#{_domain}"] = block
  end

  def resetarCache(_whom, obj)
    Gestores.invalidate
  end

  def go(_action, _target, _domain,*args)
    puts "BRE:Bre.go #{_action}:#{_target}:#{_domain}"
    _block = @bre["#{_action}:#{_target}:#{_domain}"]
    _realTarget = *args[0]
    _block.call(_realTarget[0]) if _block
  end


  def addRule(comentario,&block)
    instance_eval &block
  end

  def adicionaRegra(comentario,&block)
    addRule(comentario,&block)
  end

end


# bre = Bre.instance
#
# puts "BRE:Registrando BRE..."
#
# bre.adicionaRegra "Criacao de Servidor" do
#   quando :criar, :ci, "Servidor Virtual" do |servidor|
#     notificar "noc",  "Incluir Servidor na Monitoracao", servidor
#     notificar "dc", "Criacao backup para Servidor",  servidor
#     abrirJira :jira_tipo_tal, "Criacao de Backup para Servidor",   servidor
#   end
#   quando :criar, :ci, :site do |site|
#     notificar :equipeFacilities, "Criacao de site", site
#     notificar :equipeFinanceiro, "Criacao de site", site
#   end
# end
#
#
# bre.adicionaRegra "desligamento ex-funcionario" do
#   quando :desligar, :funcionario, "" do |funcionario|
#     mudarStatusEstacao "Em Devolucao", funcionario
#     liberarLicencas funcionario
#     notificar "suportesp", "Devolucao de Estacao", funcionario
#   end
# end
#
# bre.adicionaRegra "Carga RM" do
#   quanto :carga :funcionarios :finalizar do |f|
#     resetarCache :gestores ,f
#     notificar "gestao", "Carga Funcionario OK", f
#   end
# end
#
#
#
# bre.adicionaRegra "Mudanca de status de Servidor" do
#   quando :mudar_de_status, :ci, :servidor do |ci|
#     notificar "gmud", "Mudanca de Status de Servidor", ci
#     criar :ci, ci
#     abrir_alerta :ci, ci
#   end
# end