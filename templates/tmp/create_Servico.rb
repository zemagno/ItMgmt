# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Servico"})
  tipoci.dicdados.create({nome: "Monitoracao",tipoci_id: tipoci.id,ordem: "",url: "%s",descricao: "",valores: "",apelido: "monitoracao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Servico")
