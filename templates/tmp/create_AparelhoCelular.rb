# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Aparelho Celular"})
  tipoci.dicdados.create({nome: "Modelo",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: "",apelido: "modelo",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Imei",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "",valores: "",apelido: "imei",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Fornecedor",tipoci_id: tipoci.id,ordem: "30",url: "",descricao: "",valores: " ,Vivo,Claro,Tim",apelido: "fornecedor",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Entrega",tipoci_id: tipoci.id,ordem: "40",url: "",descricao: "",valores: "",apelido: "dataentrega",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Devol Emprestimo",tipoci_id: tipoci.id,ordem: "50",url: "",descricao: "",valores: "",apelido: "dtdevolucaoemprestimo",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Observação",tipoci_id: tipoci.id,ordem: "60",url: "",descricao: "",valores: "",apelido: "observacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Aparelho Celular")
