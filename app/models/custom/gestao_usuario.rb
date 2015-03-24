class Custom::GestaoUsuario

    attr_accessor :login
    # attr_accessor :licencasemuso
    # attr_accessor :estacoes


    def initialize(attributes = {})
        attributes.each do |name, value|
          send("#{name}=", value) if respond_to?(name)
        end
    end

    def Usuario
        @funcionario ||= Funcionario.find_by_Login(@login) 
    end

    def retrieveCIs(_tipoci)
        Ci.where(notificacao: @login, tipoci_id: _tipoci, statusci_id: 1).map { |x| {:chave => x.chave,:descricao => x.descricao,:gestor => x.Owner,:CCDebito => x.CCDebito, :ProjetoDebito => x.ProjetoDebito, :status => ""} }
    end

    def LicencasEmUso 
        @licencasemuso ||= Ci.where(notificacao: @login, tipoci_id: 13, statusci_id: 1).map { |x| {:chave => x.chave,:descricao => x.descricao,:gestor => x.Owner,:CCDebito => x.CCDebito, :ProjetoDebito => x.ProjetoDebito, :status => ""} }
    end

    def Estacoes 
        @estacoes ||= Ci.where(notificacao: @login, tipoci_id: 46, statusci_id: 1).map { |x| {:chave => x.chave,:descricao => x.descricao,:gestor => x.Owner,:CCDebito => x.CCDebito, :ProjetoDebito => x.ProjetoDebito, :status => ""} }
    end

    def Celulares 
        @celulares ||= retrieveCIs(37)
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

        distorcoes << "Usuario nao eh mais funcionario. Liberar licencas" if (!self.Usuario.nil?) and (! self.Usuario.DataDemissao.nil?) and (self.LicencasEmUso.count >0) 
        distorcoes << "Usuario nao eh mais funcionario. Liberar estacoes" if (!self.Usuario.nil?) and (! self.Usuario.DataDemissao.nil?) and (self.Estacoes.count >0) 
        


        distorcoes
    end
 
end
