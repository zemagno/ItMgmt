# language:pt
#
Funcionalidade: GestaoUsuarios
  'Ao Pesquisar por um usuario afastado,
  devo ver os dados de estacao e licencas,
  e ver todas opcoes (links), EXCETO a de alocar

  Cenario:
    Dado que eu abri um browser
    Dado que o usuario é "zemagno@gmail.com" e a senha é "xxxx"
    Dado que me loguei no sistema na URL "http://127.0.0.1:3000"
    Dado que o perfil do usuario é "suporte admin licenciamento"
    Dado que estou na pagina de gestao de usuarios
    E preencho "search" com "higa"
    E pressiono "Procurar"
    Entao eu deveria ver o texto "Nelson Higa"
    Entao eu deveria ver o texto "Afastado"
    Entao eu deveria ver o link "[Identidades]"
    Entao eu deveria ver o link "[Atributos Especificos]"
    Entao eu deveria ver o link "[Gestores e Equipe]"
    Entao eu deveria ver o link "[Inventario SW]"
    Entao eu deveria ver o link "[Inventario SW Equipe]"
    Entao eu deveria ver o link "[Identidades]"
    Entao eu NAO deveria ver o link "[Alocar Estacao]"
    Entao eu NAO deveria ver o link "[Alocar Licenca]"
    Entao eu NAO deveria ver o link "[Termo Entrega de Tudo]"
    Entao eu NAO deveria ver o link "[Termo Devolucao de Tudo]"
    Entao eu deveria ver o link "[Desalocar Estacao]"
    Entao eu deveria ver o link "[Termo Entrega]"
    Entao eu deveria ver o link "[Termo Devolucao]"
    Entao eu deveria ver o link "[Remover Licenca]"
    Entao eu NAO deveria ver o link "[link errado]"
    E clico em "[Atributos Especificos]"
    Entao eu deveria ver o texto "<b>Afastado: </b>Sim"
    Entao eu deveria ver o texto "<b>Data Inicio Afastamento: </b>2016-07-17"
  # Entao eu volto para a pagina atual
    Entao finalizo fechando o browser

