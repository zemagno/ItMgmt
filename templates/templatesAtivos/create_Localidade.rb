# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Localidade"})
  tipoci.dicdados.create({nome: "Qtde de Posicoes",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "",apelido: "posicoes",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Area",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "em m2",valores: "",apelido: "area",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Endereço",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "CNPJ",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "",valores: ",36.542.025/0001-64,36.542.025/0004-07,36.542.025/0007-50,36.542.025/0017-21,36.542.025/0010-55,36.542.025/0008-30,36.542.025/0014-89,36.542.025/0001-64,36.542.025/0015-60,36.542.025/0016-40,36.542.025/0011-36,36.542.025/0013-06,36.542.025/0019-93,36.542.025/0018-02,36.542.025/0012-17",apelido: "cnpjlocalidade",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IE",tipoci_id: tipoci.id,ordem: "22",url: "",descricao: "Inscricao Estadual",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IM",tipoci_id: tipoci.id,ordem: "23",url: "",descricao: "Inscricao Municipal",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Codigo SAP",tipoci_id: tipoci.id,ordem: "30",url: "",descricao: "Código da filial no SAP",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Outras Info",tipoci_id: tipoci.id,ordem: "50",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Documentacao",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Localidade")
