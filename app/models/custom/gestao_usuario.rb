class Custom::GestaoUsuario

    attr_accessor :login
    # attr_accessor :licencasemuso
    # attr_accessor :estacoes


    def initialize(attributes = {})
        attributes.each do |name, value|
          send("#{name}=", value) if respond_to?(name)
        end
    end

    def LicencasEmUso 
        @licencasemuso ||= Ci.where(notificacao: @login, tipoci_id: 13, statusci_id: 1).map { |x| {:chave => x.chave,:descricao => x.descricao,:gestor => x.Owner,:CCDebito => x.CCDebito, :ProjetoDebito => x.ProjetoDebito, :status => ""} }
    end

    def Estacoes 
        @estacoes ||= Ci.where(notificacao: @login, tipoci_id: 46, statusci_id: 1).map { |x| {:chave => x.chave,:descricao => x.descricao,:gestor => x.Owner,:CCDebito => x.CCDebito, :ProjetoDebito => x.ProjetoDebito, :status => ""} }
    end

    def DistorcoesUsoLicenca
        distorcoes = []

        temEAPouMSB = (! self.LicencasEmUso.index { |x| /^VSPrem.*(EAP|MSDN)/ === x[:chave] }.nil?)
        temOffice = (! self.LicencasEmUso.index { |x| /(^Office.*)/ === x[:chave] }.nil? )
        tem2Offices = self.LicencasEmUso.count{ |x| /(^Office.*)/ === x[:chave] }
        # select{ |e| ary.count(e) > 1 }.uniq

        if temOffice and temEAPouMSB
            officeErroneo = $1
            puts officeErroneo
            distorcoes << "Licenca VS Prem EAP ou MSDN permite o uso de Office. Nao eh necessario alocar licenca Office" 
            i = self.LicencasEmUso.index { |x| x[:chave] == officeErroneo }
            puts i

            @licencasemuso[i][:status] = "Erro !" unless i.nil?
        end
        distorcoes << "Usuario possui mais de uma licenca de Office" if tem2Offices > 1

        distorcoes
    end
 
end
