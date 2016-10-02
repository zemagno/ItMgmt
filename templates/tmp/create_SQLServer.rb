# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "SQLServer"})
  tipoci.dicdados.create({nome: "Data Criação",tipoci_id: tipoci.id,ordem: "1",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "datacriacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Versão",tipoci_id: tipoci.id,ordem: "3",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Ambiente",tipoci_id: tipoci.id,ordem: "3",url: "",descricao: "",valores: " Suporte a Desenvolvimento,Producao Corporativa,Desenvolvimento,Desenvolvimento Corporativo,Infra,Suporte Gerencial a Torre",apelido: "ambiente",tipo: "",regex: "",mandatorio: "false",tooltip: "Suporte a Desenvolvimento - SS, Jira, etc (uso geral) Producao  Corporativa: SAP, RM&#10;
Desenvolvimento: Usado pelos projetos&#10;
Desenvolvimento Corporativo: servidores do wleite&#10;
Infra: AV, SCCM, AD, etc&#10;
Suporte Gerencial a Torre: Usado pelas torres para controles, não para desenvolvimento",comentarios: ""})
  tipoci.dicdados.create({nome: "Tipo de Licenca",tipoci_id: tipoci.id,ordem: "3",url: "",descricao: "",valores: ",MSDN,NR,VS EAP/MSDN,Gratuita,Inclusa em Produto",apelido: "Tipolicenca",tipo: "",regex: "",mandatorio: "false",tooltip: "MSDN: SQL de parceria
NR:
VS EAP/MSDN: Usado só por quem tem Visual Studio
Gratuita: SQL Express edition
Inclusa em Algum produto",comentarios: ""})
  tipoci.dicdados.create({nome: "Disco",tipoci_id: tipoci.id,ordem: "6",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "DBA responsavel",tipoci_id: tipoci.id,ordem: "6",url: "",descricao: "login",valores: "",apelido: "dbaresponsavel",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Memoria",tipoci_id: tipoci.id,ordem: "7",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IP",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: "",apelido: "IP",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Mask",tipoci_id: tipoci.id,ordem: "12",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Ultima Validacao",tipoci_id: tipoci.id,ordem: "25",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "dtultimavalidacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Solicitação XACT",tipoci_id: tipoci.id,ordem: "110",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Alias",tipoci_id: tipoci.id,ordem: "130",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Backup",tipoci_id: tipoci.id,ordem: "180",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Consumo CPU/Disco",tipoci_id: tipoci.id,ordem: "191",url: "%s",descricao: "URL para utilizacao de CPU, Disco, etc pelo cacti",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Hostmonitor",tipoci_id: tipoci.id,ordem: "192",url: "",descricao: "",valores: " , Sim, Não",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Observação",tipoci_id: tipoci.id,ordem: "200",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("SQLServer")
