# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Range IP"})
  tipoci.dicdados.create({nome: "Default Gw",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "defaultgw",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "VLAN",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: "",apelido: "vlan",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Range IP")
