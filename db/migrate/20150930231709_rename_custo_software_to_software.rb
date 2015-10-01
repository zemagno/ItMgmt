class RenameCustoSoftwareToSoftware < ActiveRecord::Migration
  def change
  	execute %Q{ DROP VIEW CobrancaMensalUsoSoftware ; }
  	rename_table  :custo_softwares, :softwares

execute %Q{ 
Create view CobrancaMensalUsoSoftware (login,softwares,customensal) as 
select 
  s.login,
  group_concat(s.software separator " | "),
  sum(c.custoMensal)
from 
  UsoUnicoSoftware s,
  softwares c
where 
	c.software=s.software and 
    c.customensal<>0 
group by s.login }
  end
end
