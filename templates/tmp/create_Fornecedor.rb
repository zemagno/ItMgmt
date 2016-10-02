# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Fornecedor"})
  tipoci.dicdados.create({nome: "Email",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "",apelido: "email",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "CNPJ",tipoci_id: tipoci.id,ordem: "50",url: "",descricao: "xx.xxx.xxx/xxxx-xx",valores: "",apelido: "cnpjfornecedor",tipo: "",regex: "(\d{2}.\d{3}.\d{3}\/\d{4}-\d{2}\s?)*",mandatorio: "false",tooltip: "Um ou mais CNPJ no formato xx.xxx.xxx/xxxx-xx, separados por espaco",comentarios: ""})
  tipoci.dicdados.create({nome: "Razão Social",tipoci_id: tipoci.id,ordem: "51",url: "",descricao: "",valores: "",apelido: "razaosocial",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Indica Recontratacao",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: ",SIM,NAO",apelido: "indicarecontratacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Observacao",tipoci_id: tipoci.id,ordem: "101",url: "",descricao: "",valores: "",apelido: "observacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Fornecedor")
