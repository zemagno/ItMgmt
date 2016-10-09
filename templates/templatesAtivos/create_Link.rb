# Encoding: utf-8

limpar url brq, label brq e cnpjs.


begin
  tipoci = Tipoci.create({:tipo => "Link"})
  tipoci.dicdados.create({nome: "Data Ativacao",tipoci_id: tipoci.id,ordem: "1",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "DataAtivacaoLink",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Prazo de Contrato",tipoci_id: tipoci.id,ordem: "2",url: "",descricao: "Meses",valores: " , 6, 12, 24, 36",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Teste de Link",tipoci_id: tipoci.id,ordem: "2",url: "%s",descricao: "Como testar esse link",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Cliente",tipoci_id: tipoci.id,ordem: "3",url: "",descricao: "",valores: "",apelido: "cliente",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data de Renovação",tipoci_id: tipoci.id,ordem: "4",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "vencimentocontrato",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Valor Total do Contrato",tipoci_id: tipoci.id,ordem: "6",url: "",descricao: "",valores: "",apelido: "valortotalcontrato",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "% de Multa",tipoci_id: tipoci.id,ordem: "7",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Valor da Multa - Estimado",tipoci_id: tipoci.id,ordem: "9",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Endereco Ponta A (BRQ)",tipoci_id: tipoci.id,ordem: "18",url: "",descricao: "",valores: "",apelido: "pontaa",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Endereco Ponta B (Cliente)",tipoci_id: tipoci.id,ordem: "19",url: "",descricao: "",valores: "",apelido: "pontab",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Operadora",tipoci_id: tipoci.id,ordem: "21",url: "http://infra.brq.com/cis/%s",descricao: "",valores: ",Level3,GVT,Embratel,Algar,CriareNet,MegaTelecom,Mundivox,Oi,TecTreina,Telmex,Tesa,Unifor,Vivo,Copel,Hotlink,Speedy",apelido: "fornecedor",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Abordagem na Localidade",tipoci_id: tipoci.id,ordem: "22",url: "",descricao: "",valores: " , Algar , Criare Net, Embratel, GVT, Level 3, Mega Telecom, Mundivox, Oi, Tec Treina, Tecnica, Telmex, Tesa, Unifor, Vivo, Copel",apelido: "abordagemlocalidade",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Operadora exigida",tipoci_id: tipoci.id,ordem: "22",url: "",descricao: "Exigencia do Cliente",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tecnologia do Link",tipoci_id: tipoci.id,ordem: "23",url: "",descricao: "",valores: " , Clear Channel, Internet, Internet - ADSL, Lan to Lan, LP, MPLS, Radio, Internet - Radio, VPN, VPN_IP",apelido: "tecnologialink",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Designacao",tipoci_id: tipoci.id,ordem: "24",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Banda",tipoci_id: tipoci.id,ordem: "30",url: "",descricao: "MB",valores: "",apelido: "banda",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tipo de Serviços",tipoci_id: tipoci.id,ordem: "31",url: "",descricao: "",valores: "Dados",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tipo",tipoci_id: tipoci.id,ordem: "32",url: "",descricao: "",valores: "Principal, Contigência",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Switch Ponta A",tipoci_id: tipoci.id,ordem: "33",url: "",descricao: "",valores: "",apelido: "switchpontaa",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Switch Ponta B",tipoci_id: tipoci.id,ordem: "33",url: "",descricao: "",valores: "",apelido: "switchpontab",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Utilizacao",tipoci_id: tipoci.id,ordem: "70",url: "%s",descricao: "Url para CacTI",valores: "",apelido: "Utilizacao",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Monitoracao Operadora",tipoci_id: tipoci.id,ordem: "80",url: "%s",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Monitoracao",tipoci_id: tipoci.id,ordem: "81",url: "http://hostmonitor.brq.com/test.htm?id=%s ",descricao: "Id do Hostmonitor",valores: "",apelido: "monitoracao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Nota",tipoci_id: tipoci.id,ordem: "85",url: "http://infra.brq.com/notes/%s",descricao: "",valores: "",apelido: "Nota",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "CNPJ",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "Para Abertura Chamado",valores: ",36.542.025/0004-07,36.542.025/0007-50,36.542.025/0017-21,36.542.025/0010-55,36.542.025/0008-30,36.542.025/0014-89,36.542.025/0001-64,36.542.025/0015-60,36.542.025/0016-40, 36.542.025/0011-36,36.542.025/0012-17",apelido: "cnpjaberturachamado",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Range IP Externo",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "IP externo / Masc. em decimal",valores: "",apelido: "rangeipextern",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Link")
