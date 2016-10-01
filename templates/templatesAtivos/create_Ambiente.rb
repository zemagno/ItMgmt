# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Ambiente"})
  tipoci.dicdados.create({nome: "Monitoracao",tipoci_id: tipoci.id,ordem: "",url: "http://hostmonitor.brq.com/test.htm?id=%s",descricao: "",valores: "",apelido: "monitoracao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Ambiente")
