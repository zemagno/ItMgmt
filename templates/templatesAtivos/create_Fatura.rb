# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Fatura"})
  tipoci.dicdados.create({nome: "Email Fornecedor",tipoci_id: tipoci.id,ordem: "1",url: "",descricao: "",valores: "",apelido: "emailfornecedor",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Descricao Servico",tipoci_id: tipoci.id,ordem: "1",url: "",descricao: "",valores: "",apelido: "descricaoservico",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Vencimento Mensal ou Anual",tipoci_id: tipoci.id,ordem: "9",url: "",descricao: "",valores: "Mensal,Anual",apelido: "vencmensalanual",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Vencimento",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "Mes ou Dia do vencimento",valores: "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31",apelido: "vencimentomensal",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Vencimento do Contrato",tipoci_id: tipoci.id,ordem: "15",url: "",descricao: "dd/mm/aaaa",valores: "",apelido: "vencimentocontrato",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Observacao",tipoci_id: tipoci.id,ordem: "17",url: "",descricao: "",valores: "",apelido: "observacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Pre Aprovado?",tipoci_id: tipoci.id,ordem: "30",url: "",descricao: "",valores: "NAO,Pre Aprovado",apelido: "preaprovado",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Documento Autorizacao Anual",tipoci_id: tipoci.id,ordem: "31",url: "%s",descricao: "link para google docs",valores: "",apelido: "docautorizacaoanual",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Documento Contrato",tipoci_id: tipoci.id,ordem: "32",url: "%s",descricao: "Link para Contrato",valores: "",apelido: "documentcontrato",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Fornecedor",tipoci_id: tipoci.id,ordem: "50",url: "%s",descricao: "",valores: "",apelido: "fornecedor",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Debito Automatico ?",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "NAO,SIM",apelido: "debitoautomatico",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Envio ao Fiscal",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "dataenviofiscal",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Garantia",tipoci_id: tipoci.id,ordem: "105",url: "",descricao: "",valores: " ,Caução,Fiança",apelido: "garantia",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Observação Garantia",tipoci_id: tipoci.id,ordem: "110",url: "",descricao: "",valores: "",apelido: "observacaogarantia",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Energia Eletrica",tipoci_id: tipoci.id,ordem: "120",url: "",descricao: "",valores: " ,Sim,Nao",apelido: "energiaeletrica",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Agua e Esgoto",tipoci_id: tipoci.id,ordem: "125",url: "",descricao: "",valores: " ,Sim,Nao",apelido: "aguaeesgoto",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Fundo Reserva",tipoci_id: tipoci.id,ordem: "135",url: "",descricao: "",valores: " ,Sim,Nao",apelido: "fundoreserva",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IPTU",tipoci_id: tipoci.id,ordem: "140",url: "",descricao: "",valores: "",apelido: "iptu",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Fatura")
