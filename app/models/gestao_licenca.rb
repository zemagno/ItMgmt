class GestaoLicenca

  def self.LiberaLicenca(attributes = {})

    c = Ci.find_by_chave(attributes[:licenca])

    if ! c.nil?
      c.statusci_id = 8
      c.CCDebito = ""
      c.ProjetoDebito = ""
      c.Owner = "BRQ"
      c.notificacao = ""
      c._hostname = ""
      c.save!
    end
  end

  def self.AlocarLicenca(attributes = {})

    puts attributes

    licencas = GestaoLicenca.LicencasExistentes.detect {|n| n[0] == attributes[:licenca]}


    licenca_disponivel = nil
    licencas[1].each do |k|
      if (licenca_disponivel=Ci.find_by_descricao_and_statusci_id(k,8))
        break
      end
    end

    # TODO atribuicao massiva...

    if licenca_disponivel
      licenca_disponivel.Owner = attributes[:gestor]
      licenca_disponivel.notificacao = attributes[:id]
      licenca_disponivel.CCDebito = attributes[:cc]
      licenca_disponivel.ProjetoDebito = attributes[:projeto]
      licenca_disponivel.statusci_id = 1

      chave=attributes[:estacao].split(" - ")[0]
      estacao=Ci.find_by_chave(chave)
      puts "1>>>>> #{estacao.chave} - #{estacao._hostname}"
      if estacao.nil? or estacao._hostname == ""
        puts "1>>>> vou alocar pela chave :#{chave}"
        licenca_disponivel._hostname = chave
      else
        puts "1>>>> vou alocar pelo hostname :#{estacao._hostname}"
        licenca_disponivel._hostname = estacao._hostname
      end
      licenca_disponivel._solicitacao = attributes[:solicitacao]
      licenca_disponivel.save!
    end
    licenca_disponivel
  end

  def self.LicencasDisponiveis(search)
    l = Ci.where("tipoci_id = 13 and statusci_id = 8 and chave LIKE ?","#{search}%").map(&:descricao).uniq
    l
  end

  def self.LicencasExistentes
    l =JSON.parse Parametro.get({:tipo => "Licencas", :subtipo => "Catalogo"})
    l
  end
end
