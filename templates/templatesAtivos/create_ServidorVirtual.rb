# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Servidor Virtual"})
  tipoci.dicdados.create({nome: "Provedor",tipoci_id: tipoci.id,ordem: "",url: "",descricao: "",valores: "Interno,Amazon,Softlayer,Azure",apelido: "provedor",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Criação",tipoci_id: tipoci.id,ordem: "1",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "datacriacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "GW",tipoci_id: tipoci.id,ordem: "2",url: "",descricao: "",valores: "",apelido: "GW",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tipo",tipoci_id: tipoci.id,ordem: "3",url: "",descricao: "",valores: ",Suporte a Desenvolvimento,Producao Corporativa,Desenvolvimento,Desenvolvimento Corporativo,Infra,Suporte Gerencial a Torre",apelido: "tiposervidor",tipo: "",regex: "",mandatorio: "true",tooltip: "Suporte a Desenvolvimento - SS, Jira, etc (uso geral) Producao  Corporativa: SAP, RM&#10;
Desenvolvimento: Usado pelos projetos&#10;
Desenvolvimento Corporativo: servidores do wleite&#10;
Infra: AV, SCCM, AD, etc&#10;
Suporte Gerencial a Torre: Usado pelas torres para controles, não para desenvolvimento",comentarios: ""})
  tipoci.dicdados.create({nome: "Disco",tipoci_id: tipoci.id,ordem: "6",url: "",descricao: "",valores: "",apelido: "disco",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Memoria",tipoci_id: tipoci.id,ordem: "7",url: "",descricao: "",valores: "0.5GB,1GB,1.5GB,2GB,2.5gb,3GB,3.5GB,4GB,5GB,6GB,7GB,8GB,10GB,12GB,16GB,20GB,24GB",apelido: "memoria",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "CPU",tipoci_id: tipoci.id,ordem: "7",url: "",descricao: "",valores: "",apelido: "CPU",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Rede",tipoci_id: tipoci.id,ordem: "8",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IP",tipoci_id: tipoci.id,ordem: "10",url: "",descricao: "",valores: "",apelido: "IP",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "IP Externo",tipoci_id: tipoci.id,ordem: "11",url: "",descricao: "(redirect)",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Mask",tipoci_id: tipoci.id,ordem: "12",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Liberação",tipoci_id: tipoci.id,ordem: "20",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "dataliberacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Data Ultima Validacao",tipoci_id: tipoci.id,ordem: "25",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "dataultimavalidacao",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Status Validacao",tipoci_id: tipoci.id,ordem: "26",url: "",descricao: "",valores: " ,Aguardando resposta,Em analise DC",apelido: "statusvalidacao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "S.O",tipoci_id: tipoci.id,ordem: "50",url: "",descricao: "",valores: " ,Win 2000,Win 2003,Win 2008,Win 2012,Win XP,Win 7,Win 10,Linux,Solaris,Win2008R2Enterprise,Win2008R2Standard,Win2003Enterprise64,Win2003Enterprise",apelido: "SO",tipo: "",regex: "",mandatorio: "true",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Versao S.O.",tipoci_id: tipoci.id,ordem: "51",url: "",descricao: "",valores: "",apelido: "versaoSO",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Tipo de Licenca",tipoci_id: tipoci.id,ordem: "52",url: "",descricao: "",valores: ",EAP,MSDN,Parceria,Open Source,NR",apelido: "tipolicenca",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Serial",tipoci_id: tipoci.id,ordem: "53",url: "",descricao: "",valores: "",apelido: "serial",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "SW Instalado",tipoci_id: tipoci.id,ordem: "54",url: "",descricao: "",valores: "",apelido: "softwareinstalado",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Serviços",tipoci_id: tipoci.id,ordem: "55",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Solicitação XACT",tipoci_id: tipoci.id,ordem: "110",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Gerente",tipoci_id: tipoci.id,ordem: "120",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Alias",tipoci_id: tipoci.id,ordem: "130",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Backup",tipoci_id: tipoci.id,ordem: "170",url: "",descricao: "",valores: " ,SIM,NAO",apelido: "backup",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Politica Backup",tipoci_id: tipoci.id,ordem: "180",url: "",descricao: "",valores: "",apelido: "politicabackup",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Retencao Backup",tipoci_id: tipoci.id,ordem: "181",url: "",descricao: "",valores: " ,2 Meses,6 Meses,1 ano,2 anos,5 anos",apelido: "retencaobackup",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Periodicidade Backup",tipoci_id: tipoci.id,ordem: "182",url: "",descricao: "",valores: " ,Diario,Semanal,Mensal",apelido: "periodicidadebackup",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Validacao Backup",tipoci_id: tipoci.id,ordem: "183",url: "",descricao: "DD/MM/AAAA",valores: "",apelido: "validacaobackup",tipo: "",regex: "(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/20\d\d",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Monitoracao",tipoci_id: tipoci.id,ordem: "190",url: "http://hostmonitor.brq.com/test.htm?id=%s",descricao: "Id do Hostmonitor",valores: "",apelido: "monitoracao",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Cacti",tipoci_id: tipoci.id,ordem: "191",url: "%s",descricao: "Link do Cacti",valores: "",apelido: "cacti",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Observação",tipoci_id: tipoci.id,ordem: "200",url: "",descricao: "",valores: "",apelido: "",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Terceirizar",tipoci_id: tipoci.id,ordem: "1000",url: "",descricao: "",valores: "Outsourcing,Eliminar,Consolidar/Outsourcing,Riberbed,nao,Consolidar,OnPremises",apelido: "terceirizar",tipo: "",regex: "",mandatorio: "",tooltip: "",comentarios: ""})
  tipoci.dicdados.create({nome: "Migracao para Linux ?",tipoci_id: tipoci.id,ordem: "2000",url: "",descricao: "",valores: ",Ja eh linux,Migrado,Impossivel migrar,A Migrar,Pendente negociação com gestor ",apelido: "migracaolinux",tipo: "",regex: "",mandatorio: "false",tooltip: "",comentarios: ""})
rescue
end
tipoci = Tipoci.find_by_tipo("Servidor Virtual")
