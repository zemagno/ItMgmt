# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Monitor"})
  tipoci.dicdados.create({nome: "Fabricante",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: ",Samsung,HP,LG,Philips,Lenovo,Dell,AOC,STI,Dell",apelido: "fabricante",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Dimensao",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: ",19,18.5,17,15.6,15",apelido: "dimensao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Modelo",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "",apelido: "modelo",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Solicitacao",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "",apelido: "solicitacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Entregue Por",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "",apelido: "entreguepor",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Entrega",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "",apelido: "dataentrega",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Compra",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "",apelido: "datacompra",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Validade da Garantia",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "garantia",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Devol. Emprestimo",tipoci_id: tipoci.id,ordem: "1001",url: "",descricao: "Data de devolução do emprestimo",valores: "",apelido: "datadevolucaoEmprestimo",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: "nao alterar apelido pois tem consulta que usa (fora email, relatorio)"})
  tipoci.dicdados.create({nome: "Observacao",tipoci_id: tipoci.id,ordem: "2000",url: "",descricao: "",valores: "",apelido: "observacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Monitor")
