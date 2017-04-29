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
    @estacoes = @estacoes || Ci.where(notificacao: @login, statusci_id: 1, tipoci_id: 46).map { |p| "#{p.descricao} (#{p.chave})" }

  end

  # todos os softwares em uso por um usuario. Devolve array com nome dos sw
  def softwareEmUso
    params=Parametro.getJson({:tipo => "Licencas", :subtipo => "ParametrosCobranca"})
    @softwareEmUso = @softwareEmUso || Ci.where(notificacao: @login, statusci_id: 1, tipoci_id: 13, tipoCobranca: params[:statusCobranca]).pluck(:descricao)
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

  def geraExcel

    estacoes = self.estacoesEmUsoEquipeGestor

    puts @dadosGestor
    puts @dadosGestor[0]
    puts "login: [#{@dadosGestor[0][1]}]"
    path = File.expand_path('../../../tmp', __FILE__)
    filename = "#{path}/ExtratoSoftware_#{@dadosGestor[0][1]}.xlsx"

    p = Axlsx::Package.new

    wb = p.workbook

    

    wb.styles do |style|
      highlight_cell = style.add_style(bg_color: "EFC376",
                                       border: Axlsx::STYLE_THIN_BORDER,
                                       alignment: { horizontal: :left },
                                       :format_code => '# ###.##')
      date_cell = style.add_style(format_code: "yyyy-mm-dd", border: Axlsx::STYLE_THIN_BORDER)
      format_valor = style.add_style(:format_code => "#,##0.00")
      format_inteiro = style.add_style(:format_code => "#,##0")
      highlight_text = style.add_style( :bg_color => "FF0000", :type => :dxf )

      wb.add_worksheet(name: "Sw Por Funcionario") do |sheet|
        format_linha = [highlight_cell,highlight_cell] << [format_valor]*(@matrixUserSw.count-2)
        format_linha.flatten!
        @matrixUserSw.each do |licenca |
          sheet.add_row licenca , :style => format_linha
        end
      end
      wb.add_worksheet(name: "Total Por Sw") do |sheet|
        format_linha = [highlight_cell,format_inteiro] << [format_valor]*(@matrixSw.count-1)
        format_linha.flatten!
        @matrixSw.each do |licenca |
          sheet.add_row licenca, :style => format_linha
        end
        # sheet.rows.last.cells[0].sz = 14
        # sheet.rows.last.cells[0].b = true
        # sheet.rows.last.cells[2].sz = 14
        # sheet.rows.last.cells[2].b = true
      end
      wb.add_worksheet(name: "Estacoes por Usuario") do |sheet|
        format_linha = [highlight_cell,highlight_cell]
        estacoes.each do |estacao |

          sheet.add_row estacao.flatten, :style => format_linha 
        end
        # sheet.rows.last.cells[0].sz = 14
        # sheet.rows.last.cells[0].b = true
        # sheet.rows.last.cells[2].sz = 14
        # sheet.rows.last.cells[2].b = true
      end
    end

    s = p.to_stream()
    File.open(filename, 'w') { |f| f.write(s.read) }
    @dadosGestor[1] = filename

  end


  def niceSoftwareEmUsoEquipeGestor(flagReduzido = false, flagGeraExcel = false)
    @matrixUserSw = []

    @dadosGestor = [[@funcionario.NomProfissional,@funcionario.Login]]


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

    if flagReduzido
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
   
    geraExcel if flagGeraExcel


    [@dadosGestor, @matrixUserSw, @matrixSw]
  end

end


# g = LicenciamentoGestor.new("andrea")
# g.niceSoftwareEmUso

# @custoSoftware =  CustoSoftware.licencasExistentes
