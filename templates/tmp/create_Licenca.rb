# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Licenca"})
  tipoci.dicdados.create({nome: "Fabricante",tipoci_id: tipoci.id,ordem: "1",url: "",descricao: "",valores: "Microsoft,SAP,Google,Sparx,Asana,CA,IBM,Adobe,Outro",apelido: "fabricante",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Fornecedor",tipoci_id: tipoci.id,ordem: "2",url: "",descricao: "",valores: "",apelido: "fornecedor",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Nota Fiscal",tipoci_id: tipoci.id,ordem: "3",url: "",descricao: "",valores: "",apelido: "nf",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tipo Licenca",tipoci_id: tipoci.id,ordem: "6",url: "",descricao: "",valores: ",EAP,MSDN,Open,Office365 E3,Standard,NR,Nomeada,Float,Parceria,Pacote EAP ou MSDN,Inclusa em Produto,Gratuita,Assinatura",apelido: "Tipolicenca",tipo: "",regex: "",mandatorio: "false",tooltip: "EAP: Contrato EAP (atualmente, so VS)
&#10;MSDN: parceria MS
&#10;Open: Open MS
&#10;Office365 E3: contrato Office365
&#10;Standard: caixinha comprada
&#10;NR: nao registrada
&#10;Nomeada: comprada por usuario
&#10;Float 
&#10;Parceria 
&#10;Pacote EAP ou MSDN: inclusa num outro produto. Ex: office disponivel para quem tem VS EAP
&#10;Inclusa em Produto: licenca disponibilizada dentro de outro produto. Ex: SQL do SCCM",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Ativação",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "dataativacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "CC Owner Licenca",tipoci_id: tipoci.id,ordem: "11",url: "",descricao: "",valores: "",apelido: "ccownerlicenca",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Proj Owner Licenca",tipoci_id: tipoci.id,ordem: "12",url: "",descricao: "",valores: "",apelido: "projownerlicenca",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Renovacao",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "datarenovacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Ultima Validacao",tipoci_id: tipoci.id,ordem: "30",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "dataultimavalidacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Hostname",tipoci_id: tipoci.id,ordem: "40",url: "http://infra.brq.com/cis?search=%s",descricao: "",valores: "",apelido: "hostname",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Equipamento 2",tipoci_id: tipoci.id,ordem: "50",url: "",descricao: "",valores: "",apelido: "equipamento",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Status Revalidacao",tipoci_id: tipoci.id,ordem: "200",url: "",descricao: "",valores: ",Desinstalar,Revalidado,Atualizado",apelido: "statusrevalidacao",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Justificativa",tipoci_id: tipoci.id,ordem: "200",url: "",descricao: "",valores: "",apelido: "justificativa",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Solicitacao",tipoci_id: tipoci.id,ordem: "1000",url: "",descricao: "",valores: "",apelido: "solicitacao",tipo: "",regex: "\d{4}-\d{6}",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Licenca")
