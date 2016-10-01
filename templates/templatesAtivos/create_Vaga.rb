# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Vaga"})
  tipoci.dicdados.create({nome: "Controle",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "",apelido: "controle",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Carro 1",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: "",apelido: "carroa",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Carro 2",tipoci_id: tipoci.id,ordem: "11",url: "",descricao: "",valores: "",apelido: "carrob",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Carro 3",tipoci_id: tipoci.id,ordem: "12",url: "",descricao: "",valores: "",apelido: "carroc",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Carro 4",tipoci_id: tipoci.id,ordem: "13",url: "",descricao: "",valores: "",apelido: "carrod",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Carro 5",tipoci_id: tipoci.id,ordem: "14",url: "",descricao: "",valores: "",apelido: "carroe",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Carro 6",tipoci_id: tipoci.id,ordem: "15",url: "",descricao: "",valores: "",apelido: "carrof",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Carro 7",tipoci_id: tipoci.id,ordem: "16",url: "",descricao: "",valores: "",apelido: "carrog",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Validade Inicial",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "validadeinicial",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Validade Final",tipoci_id: tipoci.id,ordem: "101",url: "",descricao: "",valores: "",apelido: "validadefinal",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Vaga")
