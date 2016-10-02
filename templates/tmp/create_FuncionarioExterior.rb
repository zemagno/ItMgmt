# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "FuncionarioExterior"})
  tipoci.dicdados.create({nome: "Matricula",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "5 digitos (C+4 numeros)",valores: "",apelido: "matricula",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Próxima Revalidação",tipoci_id: tipoci.id,ordem: "15",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "dataproximarevalidacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Ramal Gestor",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "",valores: "",apelido: "ramalgestor",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("FuncionarioExterior")
