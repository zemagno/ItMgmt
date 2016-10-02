# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "VPN"})
  tipoci.dicdados.create({nome: "Monitoracao",tipoci_id: tipoci.id,ordem: "10",url: "http://hostmonitor.brq.com/test.htm?id=%s",descricao: "",valores: "",apelido: "monitoracao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IP Valido",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "",valores: "",apelido: "ipvalido",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Qtde de Usuarios",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "qtdeusuarios",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data de Instalacao",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "datainstalacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Link Utilizado",tipoci_id: tipoci.id,ordem: "100",url: "http://infra.brq.com/cis/%s",descricao: "CIs dos links",valores: "",apelido: "linkutilizado",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Ferramentas Utilizadas",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "ferramentas",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Portas Liberadas no FW",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "portalliberadas",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Qtde de Usuarios",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "qtdeusuarios",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("VPN")
