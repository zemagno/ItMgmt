# language:pt
Funcionalidade: GestaoUsuarios
	'Ao Pesquisar por um usuario, 
	     devo ver os dados de estacao e licencas'

Cenario:
    Dado que eu abri um browser
	Dado que me loguei no sistema
	Dado que estou na pagina de gestao de usuarios
	E preencho "search" com "magno"
	E pressiono "commit"
	Entao eu deveria ver "Jose Carlos Morand Magno"