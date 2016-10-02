# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Documentacao Legal"})
  tipoci.dicdados.create({nome: "Tipo",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: ",Avcb,Certificado Brigadista,Certificado Carpete,Certificado Potabilidade,Cipa,Extintor,Laudo Ergonomico,Ppra/Pcmso,Relatorio Ag. Quimicos",apelido: "tipo",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Fornecedor",tipoci_id: tipoci.id,ordem: "100",url: "%s",descricao: "",valores: "[Ci.where(:tipoci_id => 39).map(&:chave).uniq]",apelido: "fornecedor",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Reacao",tipoci_id: tipoci.id,ordem: "110",url: "",descricao: "",valores: "",apelido: "datareacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Frequencia Monitoramento",tipoci_id: tipoci.id,ordem: "120",url: "",descricao: "",valores: " ,Anual,Semestral,Trimestral,Mensal",apelido: "frequenciamonitoramento",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: "Se alterar o combobox, tem que alterar as consultas que fazem conta com semestral, mensal, etc
select nome from cadrelatorios where consulta like "%semestral%";
"})
  tipoci.dicdados.create({nome: "Responsavel",tipoci_id: tipoci.id,ordem: "130",url: "",descricao: "",valores: "",apelido: "responsavel",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Documentacao Legal")
