# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Impressora"})
  tipoci.dicdados.create({nome: "Monitoracao",tipoci_id: tipoci.id,ordem: "90",url: "%s",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "CAPEX",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "Custo de Aquisicao",valores: "",apelido: "capex",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "OPEX",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "Opex anual",valores: "",apelido: "opex",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tempo de Garantia",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "garantia",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Vida Util",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "(em anos)",valores: "",apelido: "vidautil",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Aditivo?",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "NAO,SIM",apelido: "aditivo",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Modelo",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "C2051,C242,SP 5200s,C430DN,MP C305PF,MP C305",apelido: "modelo",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IP",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "ip",tipo: "",regex: "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Ativo",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "ativo",tipo: "",regex: "\d{6}[a-zA-Z]{0,1}",mandatorio: "false",tooltip: "Se o patrimonio tiver 5 digitos, coloque um zero na frente",comentarios: ""})
  tipoci.dicdados.create({nome: "Serial",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Mail",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "SIM,NAO",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Dimensao",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Nota Fiscal",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Impressora")
