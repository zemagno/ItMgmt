class CreateViewCobrancas < ActiveRecord::Migration
  def up
  
    
execute %Q{ 
create view UsoUnicoSoftware as 
select 
  u.login as Login,
  s.software as Software
from 
	inventario_sws s, 
    inventario_users u
where 
	u.hostname = s.hostname   
group by u.login, s.software }


execute %Q{ 
Create view CobrancaMensalUsoSoftware (login,softwares,customensal) as 
select 
  s.login,
  group_concat(s.software separator " | "),
  sum(c.custoMensal)
from 
  UsoUnicoSoftware s,
  Custo_Softwares c
where 
	c.software=s.software and 
    c.customensal<>0 
group by s.login }


  end

  def down
  
 execute %Q{ DROP VIEW CobrancaMensalUsoSoftware ; }
  execute %Q{ DROP VIEW UsoUnicoSoftware  ; }
  end
end
