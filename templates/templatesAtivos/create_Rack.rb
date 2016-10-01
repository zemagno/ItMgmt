# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Rack"})
  tipoci.dicdados.create({nome: "CAPEX",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "Custo de Aquisicao",valores: "",apelido: "capex",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "OPEX",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "Opex anual",valores: "",apelido: "opex",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tempo de Garantia",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "(em anos)",valores: "",apelido: "garantia",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Vida Util",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "(em anos)",valores: "",apelido: "vidautil",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Modelo",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "modelo",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Rack")
