class RedefineViewCc < ActiveRecord::Migration
  def change
      execute %Q{ DROP VIEW CC ; }
      execute %Q{ CREATE VIEW `cc` AS select `f`.`Login` AS `LoginFunc`,`f`.`NomProfissional` AS `Nome`,`g`.`Login` AS `LoginGestor`,`f`.`OwnerCC` AS `NomeGestor`,`f`.`IdtCodigoCentroCusto` AS `CC` from (`funcionarios` `f` join `funcionarios` `g`) where ((`f`.`OwnerCC` = `g`.`NomProfissional`) and (`f`.`DtaDemissao` is null))}
  end

end
