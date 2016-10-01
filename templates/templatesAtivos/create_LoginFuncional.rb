# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Login Funcional"})
  tipoci.dicdados.create({nome: "Data Próxima Revalidação",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "",apelido: "dataproximarevalidacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "Padrao: 1 ano",comentarios: ""})
  tipoci.dicdados.create({nome: "Sistema",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "",apelido: "sistema",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Login Funcional")
