// ad.csv
// User,Criadoem,LastLogon,Expiraem,DataDesligamento,UsuarioTipo
// brqadmusr,20031008,20150801,NUNCA,NENHUM,SISTEMAS

// google_report.users.csv_20150819_17 
// primaryEmail,lastLoginTime,orgUnitPath,suspended,suspensionReason,Licenses
// a.nascimento@brq.com,2015-08-14T13:04:37.000Z,/BRQ,False,,Google-Apps-For-Business Google-Vault

// recursosalocados_ultimos30dias.csv 
// Data,Usuario,"IPs_Hosts",site
// "2015-07-14",Administrador,"10.2.71.41","Boa Vista"

// r.db('CMDB').tableCreate('identities')


create table identities (Identity varchar(30), ADUser varchar(30), ADCriadoEm Datetime, ADLastLogon Datetime, ADExpiraem Datetime, ADDataDesligamento Datetime, ADUsuarioTipo varchar(30),
	                     ADSuspended tinyint(1),
	                     GoogleprimaryEmail varchar(30), GooglelastLoginTime Datetime, GoogleorgUnitPath Datetime, GoogleSuspended tinyint(1), suspensionReason varchar(30), GoogleLicenses varchar(100)
	                     )



r.db('CMDB')


r.db('CMDB').table('identities').insert(
{ login: 'magno', ad: { lastLogon: Date('2015-08-13'), criadoEm: Date('2007-02-01'), expiraEm: Date('2099-12-31'), usuarioTipo: 'SISTEMAS'}}
)


r.db('CMDB').table('identities')

r.db('CMDB').table('identities').getAll('magno',{index: 'login'})