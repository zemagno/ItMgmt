class Gestores < ActiveRecord::Base
  attr_accessible :acao, :parametro, :userid, :processado, :cmd, :dataExecucao


  @@gestores = nil

  # Essa classe devolve dois tipos de gestores: os da tabela gestores, carregado a partir de um service, e os gestores de funcionarios, a partir da tabela funcionarios
  # TODO normalizar -- hora gestores vem de funcionarios ora de outro lugar.



  def self.deFuncionarios
		@@gestores = @@gestores || Funcionario.where(DtaDemissao: nil).map{|f| f.NomEmailGestorProfissional.downcase}.uniq
  end

  def self.invalidate
		@@gestores = nil
	end

end