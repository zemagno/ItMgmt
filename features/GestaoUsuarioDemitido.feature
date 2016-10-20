# language:pt
#
Funcionalidade: GestaoUsuarios
  'Ao Pesquisar por um usuario demitido,
  Nao devo ver CPF, Identidade,
  e ver todas opcoes (links)

  Cenario:
    Dado que eu abri um browser
    Dado que o usuario é "zemagno@gmail.com" e a senha é "xxxx"
    Dado que me loguei no sistema na URL "http://127.0.0.1:3000"
    Dado que o perfil do usuario é "suporte admin licenciamento"
    Dado que estou na pagina de gestao de usuarios
    E preencho "search" com "ganimi"
    E pressiono "commit"
    Entao eu deveria ver o texto "Rodrigo Cormack Ganimi"
    Entao eu NAO deveria ver o texto "CPF:"
    Entao eu NAO deveria ver o texto "Identidade:"
    Entao eu deveria ver o texto "Admissao: 2013-05-02"
    Entao eu deveria ver o texto "Demissao: 2014-05-30"
    Entao eu deveria ver o link "[Identidades]"
    Entao eu deveria ver o link "[Atributos Especificos]"
    Entao eu NAO deveria ver o link "[Gestores e Equipe]"
    Entao eu deveria ver o link "[Inventario SW]"
    Entao eu deveria ver o link "[Inventario SW Equipe]"
    Entao eu deveria ver o link "[Identidades]"
    Entao eu deveria ver o link "[Alocar Estacao]"
    Entao eu deveria ver o link "[Alocar Licenca]"
    Entao eu deveria ver o link "[Termo Entrega de Tudo]"
    Entao eu deveria ver o link "[Termo Devolucao de Tudo]"
    Entao eu NAO deveria ver o link "[Termo Entrega]"
    Entao eu NAO deveria ver o link "[Termo Devolucao]"
    Entao eu NAO deveria ver o link "[Remover Licenca]"
    Entao eu NAO deveria ver o link "[link errado]"
    E clico em "[Identidades]"
    Entao eu NAO deveria ver o texto "DC=BRQ,DC=COM"
    Entao eu NAO deveria ver o texto "Google-Vault-Former-Employee"
    Entao eu deveria ver o texto "2014-05-30 00:00:00 -0300"
    # Entao eu volto para a pagina atual
    Entao finalizo fechando o browser

