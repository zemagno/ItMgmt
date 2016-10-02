# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Cliente"})
  tipoci.dicdados.create({nome: "Contatos",tipoci_id: tipoci.id,ordem: "100",url: "%s",descricao: "",valores: "",apelido: "contatos",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Cliente")
