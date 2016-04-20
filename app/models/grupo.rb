class Grupo < ActiveRecord::Base
  attr_accessible :chamado, :dataCriacao, :dataValidade, :descricao, :membros, :nome, :solicitante
  # set_primary_key :nome

  # def self.getMembrosGrupo(grupo)
  #   g = Grupo.find_or_create(nome)
  #   g.membros  
  # end

  # def self.gestaoMembro (grupo)
  # 	g = Grupo.find_or_create(grupo)
  #   membros = g.membros
  #   yield
  #   g.membros = membros
  #   g.save!
  # end

  def self.addMembro(nomeGrupo,membro)
    # se grupo nao existir, cria

    # _grupo = Grupo.find_or_create_by_nome(grupo)
    _grupo = Grupo.find_by_nome(nomeGrupo)
    _membros = _grupo.membros || ""
    _grupo.membros = adicionaMembroGrupo(_membros,membro)
    _grupo.save!
 
  end

  def self.delMembro(grupo,membro)
  	g = Grupo.find_or_create_by_nome(grupo)
    membros = g.membros || ""
    membros = eliminaMembroGrupo(membros,membro)
    g.membros = membros
    g.save!
  end

  private


  def self.eliminaMembroGrupo(lista,membro)
    lista = lista.split(",").compact.uniq.delete_if { |c| c == "" || c == membro}.sort.join(",")
    lista
  end

  def self.adicionaMembroGrupo(lista,membro)
    lista << ",#{membro}"
    lista = eliminaMembroGrupo(lista,"") # para limpar, compactar a lista
    lista
  end

end
