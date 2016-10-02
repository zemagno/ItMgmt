# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Certificacao"})
  tipoci.dicdados.create({nome: "Competencia",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "competencia",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Fabricante",tipoci_id: tipoci.id,ordem: "150",url: "",descricao: "",valores: ",Microsoft",apelido: "fabricante",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Validade",tipoci_id: tipoci.id,ordem: "200",url: "",descricao: "",valores: "",apelido: "datavalidade",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Obtido por",tipoci_id: tipoci.id,ordem: "300",url: "",descricao: "login de quem obteve",valores: "",apelido: "obtidopor",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Certificacao")
