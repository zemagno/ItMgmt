class Bre

  def initialize
    @bre = Hash.new
  end

  def to_s
    @bre.each do |k,v|
       puts "BRE : #{k}"
    end
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

  def aplicarParametros(_what,_obj)
    acao = JSON.parse(Parametro.get({:tipo => "BRE", :subtipo => _what}))
    Rails.logger.debug "[DEBUG]BRE:aplicarParametros: [#{acao}]"
    acao["fields"].each do |x|
      begin
        _obj.send("#{x[0]}=", x[1])
      rescue
      end
    end
    # _obj.save!
  end

  def confirmaCC(_obj)
    # esperar 1 hora, pois o primeiro save do CI nao tem os detalhes...
  end

  def iniciarChecklist(_obj)
    # esperar 1 hora, pois o primeiro save do CI nao tem os detalhes...
  end

  def abrirAlerta(_whom,_obj)
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

  # adicionaGrupo "terceiros", terceiro 
  def adicionaGrupo(_whom,_obj)
      Grupo.addMembro(_whom,_obj.Login) if _obj.is_a? Funcionario
      Grupo.addMembro(_whom,_obj.notificacao) if _obj.is_a? Ci
  end

  def liberarLicencas(_obj)
    puts "BRE:  liberarLicencas: #{_obj.class.name} #{_obj} "
  end

  def notificarGestor(_oque,_obj)
  end

  # notificar "noc",  "Criacao de Terceiro", terceiro
  # esse notificar so aceita CI"
  def notificar(_whom,_oque,_obj)
    # TODO delay de 1 hora, para pode terminar criacao de CI e todos os campos estarem armazenados.
    puts "BRE:  Notificar alerta2: [#{_whom}] #{_obj} #{_obj.class.name} #{_obj}"
  
    
    # params = Hash[JSON.parse Parametro.get(:tipo => "BRE", :subtipo => "Notificacao")]
    # if _obj.is_a? Ci 
    #    template_id = params[_obj.tipoci_id]
    #    template_id = params[0] if template_id.nil?
    #    p = Hash[ :to => _whom, :cc => "", :subject => "Notificacao: #{_oque}", :from => "zemagno@gmail.com", :body => "Notificacao:; #{_oque}; #{_obj.chave}; #{_obj.descricao}"  ]
    # end
    # if _obj.is_a? Funcionario
    #   template_id = params[0]
    #   p = Hash[ :to => _whom, :cc => "", :subject => "Notificacao: #{_oque}", :from => "zemagno@gmail.com", :body => "Notificacao:; #{_oque}; #{_obj.Login}; #{_obj.NomProfissional}"  ]
    # end
    # job = JobEnviarEmail.criar(template_id, p.to_yaml)

    puts "  Notificar alerta2: [#{_whom}] [#{_obj.class.name}] [#{_obj}"
  end

  def quando(_action, _target, _domain, &block)
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
    instance_exec  &block
  end

  def adicionaRegra(comentario,&block)
    addRule(comentario,&block)
  end

end

