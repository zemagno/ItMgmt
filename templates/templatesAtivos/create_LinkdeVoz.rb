# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Link de Voz"})
  tipoci.dicdados.create({nome: "Numero Chave",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Canais",tipoci_id: tipoci.id,ordem: "11",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Faixa de Ramais",tipoci_id: tipoci.id,ordem: "12",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Quantidade de Ramais",tipoci_id: tipoci.id,ordem: "13",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Designação",tipoci_id: tipoci.id,ordem: "14",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Operadora",tipoci_id: tipoci.id,ordem: "15",url: "",descricao: "",valores: " ,GVT,TIM,EMBRATEL,OI",apelido: "fornecedor",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data de Ativação",tipoci_id: tipoci.id,ordem: "16",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "datativacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "CNPJ",tipoci_id: tipoci.id,ordem: "17",url: "",descricao: "Para Abertura Chamado",valores: ",36.542.025/0004-07,36.542.025/0007-50,36.542.025/0017-21,36.542.025/0010-55,36.542.025/0008-30,36.542.025/0014-89,36.542.025/0001-64,36.542.025/0015-60,36.542.025/0016-40, 36.542.025/0011-36,36.542.025/0012-17",apelido: "cnpjaberturachamado",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Renovacao",tipoci_id: tipoci.id,ordem: "18",url: "",descricao: "",valores: "",apelido: "vencimentocontrato",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Monitoracao",tipoci_id: tipoci.id,ordem: "20",url: "%s",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Nota",tipoci_id: tipoci.id,ordem: "25",url: "http://infra.brq.com/notes/%s",descricao: "",valores: "",apelido: "Nota",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Link de Voz")
