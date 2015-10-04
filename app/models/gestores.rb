class Gestores

  @@gestores = nil


  def self.all
		@@gestores = @@gestores || Funcionario.where(DtaDemissao: nil).map{|f| f.NomEmailGestorProfissional.downcase}.uniq
	end

  def self.invalidate
		@@gestores = nil
	end

end