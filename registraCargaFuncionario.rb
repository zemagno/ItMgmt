
e = Event.new(tipo: "Carga", subtipo: "Funcionarios", nivel: "resumo", valor: "Carga de Funcionarios. Ultima contratacao em #{Funcionario.last.DataAdmissao}. Total carregado: #{Funcionario.count}  ")
e.save