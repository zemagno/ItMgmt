class Bre

  def initialize
    @bre = Hash.new
  end

  def self.instance
    @instance ||= new
  end

  def incluir(_whom,_obj)
    puts "  Incluir: [#{_whom}]  #{_obj.class.name} #{_obj} #{_obj.tipo}"
  end


  def abrir_alerta(_whom,_obj)
    puts "  abrir alerta: [#{_whom}]  #{_obj.class.name} #{_obj} #{_obj.tipo}"
  end

  def mudarStatusEstacao(_whom,_obj)
    puts "  mudarStatusStacao: [#{_whom}]  #{_obj.class.name} #{_obj} "
  end

  def abrirJira(_tipo,_subject,_obj)
    puts "  abrir Jira: [#{_tipo}] #{_subject} #{_obj.class.name} #{_obj} "
  end

  def criar(_whom,_obj)
    puts "  criar: [#{_whom}]  #{_obj.class.name} #{_obj} #{_obj.tipoci.tipo}"
  end

  def liberarLicencas(_obj)
    puts "  liberarLicencas: #{_obj.class.name} #{_obj} "
  end

  def notificar(_whom,_oque,_obj)
    puts "  Notificar alerta2: [#{_whom}] #{_obj} #{_obj.class.name} #{_obj}"
  end

  def quando(_action, _target, _domain, &block)
    # puts "armazenando block #{_action}:#{_target}:#{_domain}"
    @bre["#{_action}:#{_target}:#{_domain}"] = block
  end

  def resetarCache(_whom, obj)
    Gestores.invalidate
  end

  def go(_action, _target, _domain,*args)
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
# puts "Registrando BRE..."
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