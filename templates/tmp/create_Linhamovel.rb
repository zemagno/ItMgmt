# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Linha movel"})
  tipoci.dicdados.create({nome: "Tipo de Chip",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "Normal,Micro,Nano",apelido: "tipochip",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Perfil",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: " ,Operacional,Gerencial,Executivo,Master,Master II,",apelido: "Perfil",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Operadora",tipoci_id: tipoci.id,ordem: "11",url: "",descricao: "",valores: " ,Vivo,Claro,Tim,Oi",apelido: "fornecedor",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IMEI",tipoci_id: tipoci.id,ordem: "15",url: "",descricao: "",valores: "",apelido: "IMEI",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "ICCID",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "",valores: "",apelido: "ICCID",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Modelo",tipoci_id: tipoci.id,ordem: "21",url: "",descricao: "",valores: "",apelido: "Modelo",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Status",tipoci_id: tipoci.id,ordem: "30",url: "",descricao: "",valores: ",Entregue,Pendente,Livre,Bloqueado,Cancelado",apelido: "Status",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Observação",tipoci_id: tipoci.id,ordem: "35",url: "",descricao: "",valores: "",apelido: "Obs",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Local",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "DDD da localidade (XX)",valores: "",apelido: "LocalLinhaMovel",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Dedicado ?",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "Dedicado,Pool,Plantao",apelido: "dedicado",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Fim Contrato",tipoci_id: tipoci.id,ordem: "900",url: "",descricao: "",valores: "",apelido: "vencimentocontrato",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Entrega",tipoci_id: tipoci.id,ordem: "1000",url: "",descricao: "dd/mm/aaaa",valores: "",apelido: "dataentrega",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Devolucao",tipoci_id: tipoci.id,ordem: "1001",url: "",descricao: "dd-mm-aaaa",valores: "",apelido: "dataliberacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Linha movel")
