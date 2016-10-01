# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Acesso Terceiros"})
  tipoci.dicdados.create({nome: "Descrição Contrato",tipoci_id: tipoci.id,ordem: "90",url: "%s",descricao: "",valores: "",apelido: "descricaocontrato",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Possui AD",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "",valores: " ,SIM,NAO",apelido: "possuiad",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Cracha",tipoci_id: tipoci.id,ordem: "100",url: "",descricao: "N/A ou Nº cracha (5 digitos)",valores: "",apelido: "cracha",tipo: "",regex: "(\d{5}|N\/A)",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Bloqueado",tipoci_id: tipoci.id,ordem: "105",url: "",descricao: "",valores: " ,SIM,NAO",apelido: "bloqueado",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Possui Email",tipoci_id: tipoci.id,ordem: "105",url: "",descricao: "",valores: " ,NAO,Google,Notes,ZMail(mxsec),Zimbra",apelido: "possuiemail",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tempo Contrato",tipoci_id: tipoci.id,ordem: "105",url: "",descricao: "",valores: " ,30,60,90,180",apelido: "tempocontrato",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Próxima Revalidação",tipoci_id: tipoci.id,ordem: "105",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "dataproximarevalidacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Possuir Ramal",tipoci_id: tipoci.id,ordem: "105",url: "",descricao: "",valores: " ,SIM,NAO",apelido: "possuiramal",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Observação",tipoci_id: tipoci.id,ordem: "200",url: "",descricao: "",valores: "",apelido: "observacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Acesso Terceiros")
