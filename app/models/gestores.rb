class Gestores < ActiveRecord::Base
  attr_accessible :acao, :parametro, :userid, :processado, :cmd, :dataExecucao


  @@gestores = nil


  def self.deFuncionarios
		@@gestores = @@gestores || Funcionario.where(DtaDemissao: nil).map{|f| f.NomEmailGestorProfissional.downcase}.uniq
  end

  def self.invalidate
		@@gestores = nil
	end

end