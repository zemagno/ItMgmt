class GestaoLicenciamento

  #
  # g = LicenciamentoGestor.new("ronaldocarvalho")
  # l = g.niceSoftwareEmUso

  def initialize(_login)
    @login = _login
    @funcionario = Funcionario.find_by_Login(@login)
  end

  def funcionarios
    @funcionarios = @funcionarios || GestaoUsuario.new(login: @login).funcionarios
  end

  def terceiros
    @terceiros = @terceiros || Ci.where(tipoci_id: 51, Owner: @login, statusci_id: 1).map { |ci| [ci.chave, ci.descricao] }
  end

  def self.quemUsaLicenca(_licenca)

  end

  # estacoes de um usuario, segundo o inventario, nao o CIS
  def estacoesUsuario
    # @estacoes = @estacoes || InventarioUser.estacoes(@login) # KPMG
    @estacoes = @estacoes || Ci.where(notificacao: @login, statusci_id: 1, tipoci_id: 46).pluck(:chave)

  end

  # todos os softwares em uso por um usuario. Devolve array com nome dos sw
  def softwareEmUso
    # @softwareEmUso = @softwareEmUso || InventarioSw.licencaEstacao(estacoesUsuario) # KPMG
    @softwareEmUso = @softwareEmUso || Ci.where(notificacao: @login, statusci_id: 1, tipoci_id: 13).pluck(:descricao)
  end

  def softwareEmUsoPorEstacao
    
    # montar a matriz a partir das licencas - se nao tiver estacao, paciencia..
    
    licencasAlocadas = []
    Ci.where(notificacao: @login, statusci_id: 1, tipoci_id: 13).each do |ci|
      licencasAlocadas << [ci._hostname,ci.descricao]
    end
    @softwareEmUsoPorEstacao = []
    licencasAlocadas.group_by{|x| x[0]}.each do |k,v|
      @softwareEmUsoPorEstacao << [k,v.map {|x| x[1]}]
    end
    # @softwareEmUsoPorEstacao = InventarioSw.LicencasPorEstacao(estacoesUsuario) #KPMG
    @softwareEmUsoPorEstacao
  end


  def estacoesEmUsoEquipeGestor
    @hw = []
    (funcionarios+terceiros).each do |f|
      func = GestaoLicenciamento.new(f)
      @hw << [f[0], f[1], func.estacoesUsuario]
    end
    @hw
  end

  def softwareEmUsoEquipeGestor
    @sw = []

    (funcionarios+terceiros).each do |f|
      func = GestaoLicenciamento.new(f)
      @sw << [f[0], f[1], func.softwareEmUso]
    end
    @sw
  end


  def niceSoftwareEmUsoEquipeGestor(reduzido = false)
    @matrixUserSw = []

    @dadosGestor = [[@funcionario.NomProfissional]]


    @custoSoftware = @custoSoftware || Software.licencasExistentes
    @custoSoftware.delete_if { |s| s[:status]==0 }

    l = ["Funcionario", "Funcionario"]
    @custoSoftware.each { |c| l << c[:software] }
    l << "Total Mensal"
    @matrixUserSw << l

    totalGeral = ["Total Geral", "Total Geral"]
    subTotalGeralSw = []
    subContGeralSw = []
    totalGeralSw = 0

    softwareEmUsoEquipeGestor.each do |sw|
      subtotal = 0
      l = [sw[0], sw[1]]
      c = 0
      @custoSoftware.each do |cs|
        subTotalGeralSw[c] = 0 if subTotalGeralSw[c].nil?
        if sw[2].include? cs[:software]
          # puts "#{sw[0]} - tem softare #{sw[2]} - #{cs[:software]}"
          l << '%.2f' % cs[:custoMensal]
          subtotal = subtotal + cs[:custoMensal]
          subTotalGeralSw[c] = 0 if subTotalGeralSw[c].nil?
          subTotalGeralSw[c] = subTotalGeralSw[c]+cs[:custoMensal]

          subContGeralSw[c] = 0 if subContGeralSw[c].nil?
          subContGeralSw[c] = subContGeralSw[c]+1

          totalGeralSw = totalGeralSw +cs[:custoMensal]
        else
          l << "-"
        end
        c = c + 1
      end
      l << (subtotal ==0 ? "-" : '%.2f' % subtotal)
      @matrixUserSw << l
    end

    subTotalGeralSw.each { |v| totalGeral << (v.nil? || v=="-" || v==0 ? "-" : '%.2f' % v) }
    totalGeral << '%.2f' % totalGeralSw
    @matrixUserSw << totalGeral


    @matrixSw = [["Software", "Qtde", "Custo Mensal"]]
    c = 0
    @custoSoftware.sort{ |a,b| a[:software] <=> b[:software] }.each do |cs|
      @matrixSw << [cs[:software], subContGeralSw[c].nil? ? "-" : subContGeralSw[c], subTotalGeralSw[c].nil? ? "-" : "%.2f" % subTotalGeralSw[c]]
      c = c + 1
    end
    @matrixSw << ["Total Geral", "", '%.2f' % totalGeralSw]

    if reduzido
      @lic1 = @matrixUserSw.transpose
      i = 2
      begin
        if @lic1[i].last.to_i == 0
          puts "vou apagar #{i} - #{@lic1.count-2}"
          @lic1.delete_at(i)
        else
          i = i + 1
        end
      end while i < @lic1.count
      @matrixUserSw = @lic1.transpose
    end



    [@dadosGestor, @matrixUserSw, @matrixSw]
  end

end


# g = LicenciamentoGestor.new("andrea")
# g.niceSoftwareEmUso

# @custoSoftware =  CustoSoftware.licencasExistentes
