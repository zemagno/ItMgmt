class GestaoUsuario

  attr_accessor :login
  # attr_accessor :licencasemuso
  # attr_accessor :estacoes


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value) if respond_to?(name)
    end
  end


  def funcionarios
    @funcionarios = @funcionarios || Funcionario.where(DtaDemissao: nil, NomEmailGestorProfissional: login).map { |f| [f.Login, f.NomProfissional] } #pluck(:Login) #,:NomProfissional)
  end

  # def SenhaTelefonia
  #     tls = TelLoginSenha.where(:IdtLogin => login)
  #     senhas = ""
  #     tls.each do |t|
  #         senhas << t.NumSenha.to_s
  #         senhas << " "
  #     end
  #     senhas
  # end


  def Status
    # gestor = Funcionario.where(NomEmailGestorProfissional: login).count > 0

    status=Hash.new
    status["gestor?"] = Funcionario.where(NomEmailGestorProfissional: login).count > 0 ? "Sim" : "Nao"

    status
  end

  def SenhaTelefonia
    tls = TelLoginSenha.where(:description => login)
    senhas = ""
    tls.each do |t|
      senhas << t.password.to_s
      senhas << " "
    end
    senhas
  end

  def Usuario
    @funcionario ||= Funcionario.find_by_Login(@login)
  end

  def Ramais
    begin
      @ramais ||= TelRamalLogin.where(IdtLogin: @login).map do |x|
        if x.NumRamal.to_s =~ /(\d\d)(\d\d\d\d)/
          ddd = $1
          ddd = "11" if ddd=="12"
          # se for 6 digitos, tranformo prefixo+ramal em ddd+prefixo+ramal
          "#{x.IdtLocalidade} (#{ddd.rjust(3, "0")}) #{x.Ramal.NumPrefixo}-#{$2}"
        else
          "#{x.IdtLocalidade} - #{x.NumRamal.to_s}"
        end
      end
      @ramais.join(" / ")
    rescue
        @ramais = "Erro: DB Ramais indisponivel"
    end

  end

  def Telefones

    # @telefones ||= TelRamalLogin.where(IdtLogin: @login).map { |x| "#{x.IdtLocalidade} - #{x.NumRamal.to_s[0..1]} #{x.NumPrefixo}-#{x.NumRamal.to_s[2..5]}" }.join(" / ")
  end

  def retrieveCIs(_tipoci)
    Ci.where(notificacao: @login, tipoci_id: _tipoci, statusci_id: 1).map { |x| {:chave => x.chave,:descricao => x.descricao,:gestor => x.Owner,:CCDebito => x.CCDebito, :ProjetoDebito => x.ProjetoDebito, :status => "", :hostname => x._hostname} }
  end

  def LicencasEmUso
    # @licencasemuso ||= Ci.where(notificacao: @login, tipoci_id: 13, statusci_id: 1).map { |x| {:chave => x.chave,:descricao => x.descricao,:gestor => x.Owner,:CCDebito => x.CCDebito, :ProjetoDebito => x.ProjetoDebito, :status => ""} }
    @licencasemuso ||= retrieveCIs(13)
  end

  def PosicaoFacilities
    @posicaoFacilities ||= MapaPosicao.find_by_LoginProfissional_and_FlgReserva(@login,0)
  end

  def Estacoes



    @estacoes ||= Ci.where(notificacao: @login, tipoci_id: 46, statusci_id: 1).map do |x|
      detalhes = ""
      detalhes << "#{x._tipo} " unless ! x._tipo.nil? && (x.descricao.downcase.include? x._tipo.downcase )
      detalhes << "#{x.descricao} Processador #{x._linhaprocessador} com #{x._memoria}Gb de Memoria"
      detalhes << " - Dock " if x._dock.downcase == "sim"
      detalhes << " - Mouse " if x._mouse.downcase == "sim"
      detalhes << " - Teclado " if x._tecladoextra.downcase == "sim"
      detalhes << " - Cadeado " if x._cadeado.downcase == "sim"


      {:chave => x.chave, :descricao => x.descricao,:gestor => x.Owner, :CCDebito => x.CCDebito,  :ProjetoDebito => x.ProjetoDebito, :dataEntrega => x._dataentrega,  :dataDevolucao => x._dataliberacao, :status => "",:detalhes => detalhes}
    end

    funcionario = Funcionario.find_by_Login(@login)
    @estacoes << {:chave => "Sem Estacao", :descricao => funcionario.observacao, :gestor => "", :CCDebito => "",  :ProjetoDebito => "", :dataEntrega => "",  :dataDevolucao => "", :status => "",:detalhes => funcionario.observacao}  if ! funcionario.nil? and funcionario.semEstacao
    @estacoes

  end

  def PlacaDados
    @placadados ||= Ci.where(notificacao: @login, tipoci_id: 36, statusci_id: 1).map do |x|
      detalhes = "Placa Dados "
      detalhes << "#{x._fornecedor}" unless x._fornecedor.blank?
      detalhes << " ICCID:#{x._ICCID}" unless x._ICCID.blank?
      detalhes << " IMEI:#{x._IMEI}" unless x._IMEI.blank?
      detalhes << " Modelo:#{x._Modelo}" unless x._Modelo.blank?
      {:chave => x.chave, :descricao => x.descricao,:gestor => x.Owner, :CCDebito => x.CCDebito,  :ProjetoDebito => x.ProjetoDebito, :dataEntrega => x._dataentrega,  :dataDevolucao => x._dataliberacao, :status => "",:detalhes => detalhes, :obs => x._Obs }
    end
  end

  def Monitores
    @monitores ||= Ci.where(notificacao: @login, tipoci_id: 49, statusci_id: 1).map do |x|
      detalhes = "Monitor"

      detalhes << " #{x._fabricante}" unless x._fabricante.blank?
      detalhes << " #{x._dimensao}'" unless x._dimensao.blank?
      detalhes << " Modelo #{x._modelo}" unless x._modelo.blank?
      {:chave => x.chave, :descricao => x.descricao,:gestor => x.Owner, :CCDebito => x.CCDebito,  :ProjetoDebito => x.ProjetoDebito, :dataEntrega => x._dataentrega,  :dataDevolucao => x._dataliberacao, :status => "",:detalhes => detalhes, :obs => x._Obs }
    end
  end

  def Celulares


    @celulares ||= Ci.where(notificacao: @login, tipoci_id: 37, statusci_id: 1).map do |x|
      detalhes = ""
      detalhes << "Chip #{x._fornecedor}" unless x._fornecedor.blank?
      detalhes << " ICCID:#{x._ICCID}" unless x._ICCID.blank?
      detalhes << " IMEI:#{x._IMEI}" unless x._IMEI.blank?
      detalhes << " Modelo:#{x._Modelo}" unless x._Modelo.blank?
      {:chave => x.chave,:descricao => x.descricao,:gestor => x.Owner,:CCDebito => x.CCDebito, :ProjetoDebito => x.ProjetoDebito, :dataEntrega => x._dataentrega, :dataDevolucao => x._dataliberacao, :status => "", :detalhes => detalhes , :obs => x._Obs}
    end
  end


  def self.LiberaEstacao(attributes = {})

    c = Ci.find_by_chave(attributes[:estacao])

    c.libera_estacao if ! c.nil?
  end

  def DistorcoesUsoLicenca
    distorcoes = []

    temEAPouMSDN = (! self.LicencasEmUso.index { |x| /^VSPrem.*(EAP|MSDN)/ === x[:chave] }.nil?)
        
        #### ATENCAO... o IF abaixo tem que ser logo apos o index, para nao perder o $1
        temOffice = self.LicencasEmUso.count { |x| /(^Office.*)/ === x[:chave] } - self.LicencasEmUso.count { |x| /(^Office.*VS.*)/ === x[:chave] }
        if (temOffice>0) and temEAPouMSDN
            # officeErroneo = $1
            # i = self.LicencasEmUso.index { |x| x[:chave] == officeErroneo } 
            # @licencasemuso[i][:status] = "Erro !" unless i.nil?
            distorcoes << "Licenca VS Prem EAP ou MSDN permite o uso de Office. Trocar para licenca Office_VS_EAP" 
        end

        ["Project","VSS","Visio","Office"].each do |l|
            if self.LicencasEmUso.count{ |x| /(^#{l}.*)/ === x[:chave] } >1
                                                         distorcoes << "Usuario possui mais de uma licenca de #{l}"
                                                         end
                                                         end

                                                         distorcoes << "Usuario nao eh mais funcionario. Liberar licencas" if (!self.Usuario.nil?) and (self.Usuario.demitido?) and (self.LicencasEmUso.count >0)
                                                         distorcoes << "Usuario nao eh mais funcionario. Liberar estacoes" if (!self.Usuario.nil?) and (self.Usuario.demitido?) and (self.Estacoes.count >0)



                                                         distorcoes
                                                         end

                                                         end
