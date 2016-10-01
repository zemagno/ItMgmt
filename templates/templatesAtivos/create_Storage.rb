# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Storage"})
  tipoci.dicdados.create({nome: "Versao",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tipo",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Disco",tipoci_id: tipoci.id,ordem: "30",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Memoria",tipoci_id: tipoci.id,ordem: "40",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Rede",tipoci_id: tipoci.id,ordem: "50",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "GW",tipoci_id: tipoci.id,ordem: "60",url: "",descricao: "",valores: "",apelido: "GW",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IP",tipoci_id: tipoci.id,ordem: "70",url: "",descricao: "",valores: "",apelido: "IP",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Mask",tipoci_id: tipoci.id,ordem: "80",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "S.O",tipoci_id: tipoci.id,ordem: "90",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "CAPEX",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "Custo de Aquisição",valores: "",apelido: "capex",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "OPEX ",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "Opex anual",valores: "",apelido: "opexanual",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Validade da Garantia",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "Garantia",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Vida Util",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "(em anos)",valores: "",apelido: "vidautil",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Versao S.O",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Servicos",tipoci_id: tipoci.id,ordem: "110",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Alias",tipoci_id: tipoci.id,ordem: "120",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Monitoracao URL para Cacti ou equivalente",tipoci_id: tipoci.id,ordem: "120",url: "%s",descricao: "",valores: "",apelido: "MonitoracaoURL",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Observação",tipoci_id: tipoci.id,ordem: "130",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Terceirizar",tipoci_id: tipoci.id,ordem: "130",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Numero(s) de Serie",tipoci_id: tipoci.id,ordem: "1000",url: "",descricao: "",valores: "",apelido: "numeroserie",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Storage")
