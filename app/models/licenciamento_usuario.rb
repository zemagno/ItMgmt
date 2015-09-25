class LicenciamentoUsuario

	def initialize(_login)
		@login = _login
	end

	def estacoesUsuario
		@estacoes = @estacoes || InventarioUser.where(login: @login).pluck(:hostname)
	end

	def softwareEmUso
		@softwareEmUso = @softwareEmUso || InventarioSw.licencaEstacao(estacoesUsuario)
    end

end