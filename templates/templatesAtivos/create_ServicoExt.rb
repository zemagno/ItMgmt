# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "ServicoExt"})
  tipoci.dicdados.create({nome: "IP",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: "",apelido: "IP",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Portas",tipoci_id: tipoci.id,ordem: "15",url: "",descricao: "",valores: "",apelido: "portas",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Contingencia",tipoci_id: tipoci.id,ordem: "20",url: "%s",descricao: "",valores: "",apelido: "contingencia",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Monitaracao",tipoci_id: tipoci.id,ordem: "25",url: "http://hostmonitor.brq.com/test.htm?id=%s",descricao: "Id do Hostmonitor",valores: "",apelido: "Monitoracao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("ServicoExt")
