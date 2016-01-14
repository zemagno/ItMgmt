class AddViewCarga < ActiveRecord::Migration
 def up
  
    
execute %Q{ 
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwcargaativosportal` AS 

SELECT `cis`.`chave` AS `Patrimonio`,
       `cis`.`notificacao` AS `usuario`,
       concat('Placa de dados :',`cis`.`chave`,' Operadora: ',max(if((`atributos`.`dicdado_id` = 172),`atributos`.`valor`,NULL))) AS `ativo`,
       max(if((`atributos`.`dicdado_id` = 419),`atributos`.`valor`,NULL)) AS `DataEntrega`,
       max(if((`atributos`.`dicdado_id` = 418),`atributos`.`valor`,NULL)) AS `DataDevolucao`
FROM (`cis`
      JOIN `atributos`)
WHERE ((`cis`.`tipoci_id` = 36)
       AND (`atributos`.`ci_id` = `cis`.`id`)
       AND (`cis`.`statusci_id` = 1)
       AND (`cis`.`notificacao` <> '')
       AND (`cis`.`notificacao` <> '-')
       AND (`cis`.`notificacao` <> 'BRQ'))
GROUP BY `cis`.`chave`
UNION
SELECT `cis`.`chave` AS `Patrimonio`,
       `cis`.`notificacao` AS `Usuario`,
       concat('Celular :',`cis`.`chave`,' Operadora: ',max(if((`atributos`.`dicdado_id` = 173),`atributos`.`valor`,NULL))) AS `Ativo`,
       max(if((`atributos`.`dicdado_id` = 420),`atributos`.`valor`,NULL)) AS `DataEntrega`,
       max(if((`atributos`.`dicdado_id` = 421),`atributos`.`valor`,NULL)) AS `DataDevolucao`
FROM (`cis`
      JOIN `atributos`)
WHERE ((`cis`.`tipoci_id` = 37)
       AND (`atributos`.`ci_id` = `cis`.`id`)
       AND (`cis`.`statusci_id` = 1)
       AND (`cis`.`notificacao` <> '')
       AND (`cis`.`notificacao` <> '-')
       AND (`cis`.`notificacao` <> 'BRQ'))
GROUP BY `cis`.`chave`
UNION
SELECT `cis`.`chave` AS `Patrimonio`,
       `cis`.`notificacao` AS `Usuario`,
       concat(`cis`.`descricao`,' Modelo: ',max(if((`atributos`.`dicdado_id` = 308),`atributos`.`valor`,NULL)),' ',max(if((`atributos`.`dicdado_id` = 309),`atributos`.`valor`,NULL))) AS `Ativo`,
       max(if((`atributos`.`dicdado_id` = 318),`atributos`.`valor`,NULL)) AS `DataEntrega`,
       max(if((`atributos`.`dicdado_id` = 409),`atributos`.`valor`,NULL)) AS `DataDevolucao`
FROM (`cis`
      JOIN `atributos`)
WHERE ((`cis`.`tipoci_id` = 46)
       AND (`atributos`.`ci_id` = `cis`.`id`)
       AND (`cis`.`statusci_id` = 1)
       AND `cis`.`id` IN
         (SELECT `atributos`.`ci_id`
          FROM `atributos`
          WHERE ((`atributos`.`dicdado_id` = 306)))
       AND (`cis`.`notificacao` <> '')
       AND (`cis`.`notificacao` <> '-')
       AND (`cis`.`notificacao` <> 'BRQ'))
GROUP BY `cis`.`chave`
}


  end

  def down
  
 execute %Q{ DROP VIEW vwcargaativosportal ; }
  
  end
end
