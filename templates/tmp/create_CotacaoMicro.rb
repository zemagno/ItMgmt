# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Cotacao Micro"})
  tipoci.dicdados.create({nome: "Quantidade",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "Ate 99 itens",valores: "",apelido: "quantidade",tipo: "",regex: "\d{1,2}",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tipo Equipamento",tipoci_id: tipoci.id,ordem: "15",url: "",descricao: "Notebook, Desktop, etc",valores: "",apelido: "tipoequipamento",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Processador",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "",valores: ",i3,i5,i7,xeon",apelido: "processador",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Memoria",tipoci_id: tipoci.id,ordem: "21",url: "",descricao: "",valores: " ,3gb,4gb,6gb,8gb,12gb,16gb",apelido: "memoria",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "HD",tipoci_id: tipoci.id,ordem: "22",url: "",descricao: "",valores: " ,300gb,500gb,1T,2T",apelido: "hd",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Monitor",tipoci_id: tipoci.id,ordem: "23",url: "",descricao: "",valores: "Sem Monitor, 17", 19", 21"",apelido: "monitor",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Softwares Inclusos",tipoci_id: tipoci.id,ordem: "25",url: "",descricao: "win oem ? office ? ",valores: "",apelido: "softwareincluso",tipo: "",regex: "",mandatorio: "true",tooltip: "Especifique se quer Windows OEM ou qq outro pacote ?",comentarios: ""})
  tipoci.dicdados.create({nome: "Email Adicional Fornecedores",tipoci_id: tipoci.id,ordem: "40",url: "",descricao: "",valores: "",apelido: "emailfornecedores",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Fornecedor 1",tipoci_id: tipoci.id,ordem: "50",url: "",descricao: "",valores: "",apelido: "fornecedora",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Cotacao 1",tipoci_id: tipoci.id,ordem: "51",url: "",descricao: "",valores: "",apelido: "cotacaoum",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "URL",tipoci_id: tipoci.id,ordem: "52",url: "%s",descricao: "",valores: "",apelido: "url",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Fornecedor 2",tipoci_id: tipoci.id,ordem: "60",url: "",descricao: "",valores: "",apelido: "fornecedordois",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Cotacao 2",tipoci_id: tipoci.id,ordem: "62",url: "",descricao: "",valores: "",apelido: "cotacaodois",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "URL",tipoci_id: tipoci.id,ordem: "63",url: "",descricao: "",valores: "",apelido: "url",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Fornecedor 3",tipoci_id: tipoci.id,ordem: "70",url: "",descricao: "",valores: "",apelido: "fornecedortres",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Cotacao 3",tipoci_id: tipoci.id,ordem: "71",url: "",descricao: "",valores: "",apelido: "cotacaotres",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "URL",tipoci_id: tipoci.id,ordem: "72",url: "",descricao: "",valores: "",apelido: "url",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Requisicao Compras SAP",tipoci_id: tipoci.id,ordem: "190",url: "",descricao: "",valores: "",apelido: "requisicaosap",tipo: "",regex: "6\d{9}",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Patrimonio",tipoci_id: tipoci.id,ordem: "200",url: "",descricao: "",valores: "",apelido: "patrimonio",tipo: "",regex: "\d{6}(,\d{6})*",mandatorio: "false",tooltip: "Numeros de patrimonio, com 6 digitos separados por virgula.
Ex: 012312 ou 012312,031243,12354",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Cotacao Micro")
