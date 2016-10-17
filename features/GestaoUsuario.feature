# language:pt
# 
Funcionalidade: GestaoUsuarios
	'Ao Pesquisar por um usuario, 
	     devo ver os dados de estacao e licencas'

Cenario:
    Dado que eu abri um browser
	Dado que o usuario é "zemagno@gmail.com" e a senha é "xxxx"
	Dado que me loguei no sistema na URL "http://127.0.0.1:3000"
	Dado que o perfil do usuario é "suporte admin licenciamento"
	Dado que estou na pagina de gestao de usuarios
	E preencho "search" com "magno"
	E pressiono "commit"
	Entao eu deveria ver o texto "Jose Carlos Morand Magno"
	Entao eu deveria ver o texto "Andrea Ribeiro Quadros"
	Entao eu deveria ver o texto "010916"
	Entao eu deveria ver o texto "023710"
	Entao eu deveria ver o texto "OfficeStd2010_0011 - Estacao:DT013002"
	Entao eu deveria ver o texto "OfficeProf_MSDN_0001 - Estacao:NB023710"
	Entao eu deveria ver o texto "VA (021) 3211-9831"
	Entao eu deveria ver o texto "Asana - Estacao:"
	Entao eu deveria ver o texto "LicençaSAP - Estacao:"
	Entao eu deveria ver o texto "OfficeMac001 - Estacao:023710"
	Entao eu deveria ver o texto "Usuario possui mais de uma licenca de Office"
	Entao eu deveria ver o link "[Identidades]"
	Entao eu deveria ver o link "[Atributos Especificos]"
	Entao eu deveria ver o link "[Gestores e Equipe]"
	Entao eu deveria ver o link "[Inventario SW]"
	Entao eu deveria ver o link "[Inventario SW Equipe]"
	Entao eu deveria ver o link "[Identidades]"
	Entao eu deveria ver o link "[Alocar Estacao]"
	Entao eu deveria ver o link "[Alocar Licenca]"
	Entao eu deveria ver o link "[Termo Entrega de Tudo]"
	Entao eu deveria ver o link "[Termo Devolucao de Tudo]"
	Entao eu NAO deveria ver o link "[link errado]"
	E clico "[Identidades]"
	Entao eu deveria ver o texto "CN=magno,OU=Users,OU=INFRA,OU=VARGAS,DC=BRQ,DC=COM"
	Entao eu deveria ver o texto "Google-Vault-Former-Employee"
	Entao eu deveria ver o texto "2007-02-02"
	Entao eu deveria ver o texto "FUNCIONARIO"
	Entao eu deveria ver o texto "Office 365 (Plan E3)"
	Entao eu NAO deveria ver o texto "Office 365 (Plan E1)"
	Entao eu volto para a pagina atual

	Entao finalizo fechando o browser


# Cenario:
#     Dado que eu abri um browser
# 	Dado que o usuario é "zemagno@gmail.com" e a senha é "xxxx"
# 	Dado que me loguei no sistema na URL "http://127.0.0.1:3000"
# 	Dado que o perfil do usuario é "suporte"
# 	Dado que estou na pagina de gestao de usuarios
# 	E preencho "search" com "magno"
# 	E pressiono "commit"
# 	Entao eu deveria ver o texto "Jose Carlos Morand Magno"
# 	Entao eu deveria ver o texto "Andrea Ribeiro Quadros"
# 	Entao eu deveria ver o texto "010916"
# 	Entao eu deveria ver o texto "023710"
# 	Entao eu deveria ver o texto "OfficeStd2010_0011 - Estacao:DT013002"
# 	Entao eu deveria ver o texto "VA (021) 3211-9831"
# 	Entao eu deveria ver o texto "Asana - Estacao:"
# 	Entao eu deveria ver o link "[Identidades]"
# 	Entao eu deveria ver o link "[Atributos Especificos]"
# 	Entao eu deveria ver o link "[Gestores e Equipe]"
# 	Entao eu deveria ver o link "[Inventario SW]"
# 	Entao eu deveria ver o link "[Inventario SW Equipe]"
# 	Entao eu deveria ver o link "[Identidades]"
# 	Entao eu deveria ver o link "[Alocar Estacao]"
# 	Entao eu NAO deveria ver o link "[Alocar Licenca]"
# 	Entao eu deveria ver o link "[Termo Entrega de Tudo]"
# 	Entao eu deveria ver o link "[Termo Devolucao de Tudo]"
# 	Entao finalizo fechando o browser
# 
