class LimitaNomeCadRelatorioEJobs < ActiveRecord::Migration
  def change
  	execute %Q{ ALTER TABLE cadrelatorios MODIFY COLUMN nome varchar(30); }
  	execute %Q{ ALTER TABLE producaos MODIFY COLUMN job varchar(50); }
  end

end
