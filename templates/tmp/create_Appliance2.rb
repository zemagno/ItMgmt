# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Appliance2"})
  tipoci.dicdados.create({nome: "Tipo Equipamento",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: ",Ar Condicionado,Roteador,Rack,Media Gateway,TV,Video Conferencia,Access Point,AccWan,Library,Ata,Projetor,CFTV,NoBreak,Gerador,Outros",apelido: "tipoequipamento",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Appliance2")
