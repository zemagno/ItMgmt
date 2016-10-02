# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Placa de Dados"})
  tipoci.dicdados.create({nome: "Tecnologia",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: "3G,4G",apelido: "Tecnologia",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Operadora",tipoci_id: tipoci.id,ordem: "11",url: "",descricao: "",valores: " ,VIVO,CLARO,TIM,OI",apelido: "fornecedor",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Pacote",tipoci_id: tipoci.id,ordem: "15",url: "",descricao: "",valores: "300MB,600MB,1GB,2GB,3GB,5GB,10GB,20GB,40GB,60GB,80GB,100GB",apelido: "Pacote",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IMEI",tipoci_id: tipoci.id,ordem: "15",url: "",descricao: "",valores: "",apelido: "IMEI",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "ICCID",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "",valores: "",apelido: "ICCID",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Modelo",tipoci_id: tipoci.id,ordem: "21",url: "",descricao: "",valores: "",apelido: "Modelo",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Status",tipoci_id: tipoci.id,ordem: "30",url: "",descricao: "",valores: " ,Entregue,Pendente,Livre,Bloqueado,Cancelado",apelido: "Status",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Observação",tipoci_id: tipoci.id,ordem: "35",url: "",descricao: "",valores: "",apelido: "Obs",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Fim Contrato",tipoci_id: tipoci.id,ordem: "900",url: "",descricao: "",valores: "",apelido: "vencimentocontrato",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Entrega",tipoci_id: tipoci.id,ordem: "1000",url: "",descricao: "dd/mm/aaaa",valores: "",apelido: "dataentrega",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Devolucao",tipoci_id: tipoci.id,ordem: "1001",url: "",descricao: "dd-mm-aaaa",valores: "",apelido: "dataliberacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Placa de Dados")
