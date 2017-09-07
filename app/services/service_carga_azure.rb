class ServiceCargaAzure



  def go

      detalhe = ""
      total_replaced = 0
      total_created = 0
      total_ativos_lidos = 0
      total_ativos_mapeados = 0
      ativos_nao_achados = ""
      status = "Ok"


      colecaoConfigNuvem=JSON.parse Parametro.get(:tipo => "MappingNuvem", :subtipo => "Azure")

      colecaoConfigNuvem.each do |configNuvem|

        resultadoNuvem = JSON.parse File.read(configNuvem["file"])

        resultadoNuvem.each do |item|

        _modoCriacao = configNuvem["mode"] == "create_or_update"

        flag = :update
        if _modoCriacao
          ci = Ci.find_or_create_by(chave: item[configNuvem['chave']])
          puts "ci: new record? #{ci.new_record?}"
          if ci.new_record?
            flag = :criado
            total_created = total_created + 1
          else
            total_replaced = total_replaced + 1
          end 
        else
          ci = Ci.find_by_chave(item[configNuvem['chave']])
        end

        total_ativos_lidos = total_ativos_lidos + 1
        
        if ! ci
          ativos_nao_achados << "[#{item[configNuvem['chave']]}] - "
        else           
          total_ativos_mapeados = total_ativos_mapeados + 1

          # para cada mapeamento configNuvem["mapping"], vou navegar no item lido do json azure ate achar o valor. 
          # Ex:  "_tiposervidorazure":["hardwareProfile","vmSize"]
          # v = ["hardwareProfile","vmSize"]
          # acho no json por
          #   "hardwareProfile": {
          #       "vmSize": "Basic_A1"
          #    },
          # no final, "no" vai ter o valor Basic_A1 e _k vai ter o valor _tiposervidorazure
          #    
          attr = Hash.new       
          configNuvem["mapping"].each do |k,v|
            begin
              _regex = nil 
              

              # k = _tiposervidorazure
              # v = ["hardwareProfile","vmSize"]
              # item = JSON inteiro..

              
              if v[0] == 'REGEX'
                # se primeiro parametro for REGEX(["mapp"],regex) , navego a partir do 3 atributo e depois extraio o parametro baseado no regex 
                # "/subscriptions/a297a50e-dbe8-4a3f-9599-3b3010d01451/resourceGroups/PRD/providers/Microsoft.Compute/virtualMachines/gam"
                # "_subscriptionid":["REGEX","\/subscriptions\/(.*)\/resourceGroups.*","id"] 
                
                _regex = v[1]
                v = v[2,99]
                no = item 
                v.each { |n| no = no[n]}
                no = no.match(_regex).captures[0]
              else
                no = item 
                v.each { |n| no = no[n]}
              end
              
              attr[k] = no
            rescue
              # nao achou o mapping no json. TODO logar erro 
              status = "Warning"
            end
          end 
          
          # begin


          # primeiro, vou atualizar os CAMPOS default padroes (normais e so de criacao) do CI 
          ci.updateJson(attr.reject {|k,v| k[0]=="_" })
          ci.updateDefaultJson(configNuvem["default"].reject {|k,v| k[0]=="_" })
          ci.updateDefaultJson(configNuvem["default-criacao"].reject {|k,v| k[0]=="_" }) if _modoCriacao and flag == :criado and ! configNuvem["default-criacao"].blank?

          ci.save!

          # depois de salvo, consigo atualizar os ATRIBUTOS padroes (normais e so de criacao) do CI. 
          ci.updateJson(attr.reject {|k,v| k[0]!="_" })
          ci.updateDefaultJson(configNuvem["default"].reject {|k,v| k[0]!="_" })
          puts "ci: #{ci.chave}: _modoCriacao #{_modoCriacao} - flag #{flag}"
          ci.updateDefaultJson(configNuvem["default-criacao"].reject {|k,v| k[0]!="_" }) if _modoCriacao and flag == :criado and ! configNuvem["default-criacao"].blank?


            
          # rescue => error
          #   Rails.logger.debug error.backtrace
          #   puts "erro no save do CI"
          #   status = "Warning"
          # end

        end # if ! ci
      end
    end
    detalhe << "Total de ativos lidos do azure: #{total_ativos_lidos} / "
    detalhe << "Total de ativos mapeados: #{total_ativos_mapeados} / "
    detalhe << "  Ativos nao encontrados: #{ativos_nao_achados} / " if ativos_nao_achados != ""

    detalhe << "Total de ativos criados: #{total_created} / "
    detalhe << "Total de ativos atualizados: #{total_replaced}"

   

    Event.register("Carga", "Azure", "detalhe", "#{status} - #{detalhe}")
    [status, detalhe]
    end
end


# exemplo de um JSON de customizacao
# 
# [{"mode":"update", 
#  "chave":"name",  
#   "mapping":{
#         "_estadoNuvem":["powerState"], 
#         "_versaoSO":["storageProfile", "osDisk", "osType"],
#         "_location":["location"],
#         "_tiposervidorazure":["hardwareProfile","vmSize"],
#         "_vmId":["vmId"],
#         "descricao":["tags","Descricao"],
#         "_subscriptionid":["REGEX","\/subscriptions\/(.*)\/resourceGroups.*","id"]
#   },
# "default":{
#   "descricao": "Azure - Erro - Sem descricao",
#   "gestor":"Magno",
#   "usuarios":"Magno",
#   "tipoci_id":32,
#   "statusci_id":1
#   },
# "default-criacao":{
#   "_statuscoleta":"Recem Inventariado"
#   },
#  "impactados":{
#         "1":["REGEX","\/subscriptions\/(.*)\/resourceGroups.*","id"],
#         "2":["REGEX","\/subscriptions\/(.*)\/resourceGroups.*","id"]
#  },
# "dependentes":{
#         "1":["REGEX","\/subscriptions\/(.*)\/resourceGroups.*","id"],
#         "2":["REGEX","\/subscriptions\/(.*)\/resourceGroups.*","id"]
#  },
#  "file":"/Users/magno/Dropbox/docker/Gam/4MSTech/azure-output/vm.list.json"
# },
# {"mode":"create_or_update", 
#  "chave":"id",  
#   "mapping":{
#         "_tenantId":["tenantId"], 
#         "descricao":["name"],
#         "_isDefault":["isDefault"],
#         "_subscriptionId":["id"]
#   },
# "default":{
#   "descricao": "Azure Account - Erro - Sem descricao",
#   "gestor":"Magno",
#   "usuarios":"Magno",
#   "tipoci_id":75,
#   "statusci_id":1
#   },
#  "file":"/Users/magno/Dropbox/docker/Gam/4MSTech/azure-output/account.list.json"
# } 
# ]
