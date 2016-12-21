# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Excecao"})
  tipoci.dicdados.create({nome: "Solicitante",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: "",apelido: "solicitante",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data de revalidacao",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "",valores: "",apelido: "datarevalidacao",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tipo de excecao",tipoci_id: tipoci.id,ordem: "30",url: "",descricao: "",valores: ",Email,Repositorio,Cracha",apelido: "tipodeexcecao",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Excecao")
