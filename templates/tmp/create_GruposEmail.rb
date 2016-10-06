# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "GruposEmail"})
  tipoci.dicdados.create({nome: "Data de revalidacao",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "Revalidacao anual de grupos de email",valores: "",apelido: "datarevalidacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Solicitante",tipoci_id: tipoci.id,ordem: "20",url: "%s",descricao: "Solicitante do grupo de email",valores: "",apelido: "solicitante",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Motivo",tipoci_id: tipoci.id,ordem: "30",url: "",descricao: "Motivo da criação do gripo de email",valores: "",apelido: "motivo",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Revalidar",tipoci_id: tipoci.id,ordem: "40",url: "",descricao: "Necessário revalidação pelo CMDB?",valores: ",Sim,Nao",apelido: "revalidar",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("GruposEmail")
