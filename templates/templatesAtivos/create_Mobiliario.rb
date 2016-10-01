# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Mobiliario"})
  tipoci.dicdados.create({nome: "Tipo",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: ",Mesa,Cadeira,Cadeira Especial,Gaveteiro,Armario",apelido: "tipo",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Observação",tipoci_id: tipoci.id,ordem: "200",url: "",descricao: "",valores: "",apelido: "observacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Mobiliario")
