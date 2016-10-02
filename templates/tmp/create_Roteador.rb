# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Roteador"})
  tipoci.dicdados.create({nome: "Propriedade",tipoci_id: tipoci.id,ordem: "5",url: "",descricao: "",valores: " , BRQ , Alugado , Fornecedor Link",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Ativo BRQ",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: "",apelido: "ativo",tipo: "",regex: "\d{6}[a-zA-Z]{0,1}",mandatorio: "false",tooltip: "Se o patrimonio tiver 5 digitos, coloque um zero na frente",comentarios: ""})
  tipoci.dicdados.create({nome: "Modelo",tipoci_id: tipoci.id,ordem: "15",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Marca",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Serial",tipoci_id: tipoci.id,ordem: "25",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Portas disponíveis utilizadas ",tipoci_id: tipoci.id,ordem: "35",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tipos de conexões",tipoci_id: tipoci.id,ordem: "40",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IOs",tipoci_id: tipoci.id,ordem: "45",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Senha SNMP Publico",tipoci_id: tipoci.id,ordem: "50",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Hostname",tipoci_id: tipoci.id,ordem: "55",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Monitoracao",tipoci_id: tipoci.id,ordem: "60",url: "%s",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Utilizacao",tipoci_id: tipoci.id,ordem: "65",url: "%s",descricao: "Url para CacTI",valores: "",apelido: "utilizacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "CAPEX",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "Custo de Aquisicao",valores: "",apelido: "capex",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "OPEX",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "Opex anual",valores: "",apelido: "opex",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tempo de Garantia",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "(em anos)",valores: "",apelido: "garantia",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Vida Util",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "(em anos)",valores: "",apelido: "vidautil",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Roteador")
