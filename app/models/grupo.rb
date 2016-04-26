class Grupo < ActiveRecord::Base
  attr_accessible :chamado, :dataCriacao, :dataValidade, :descricao, :membros, :nome, :solicitante

  def to_s
    "#{id}: #{nome} - #{membros}"
  end
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
    _grupo = Grupo.find_or_create_by_nome(nomeGrupo)
    _membros = _grupo.membros || ""
    _membros << ",#{membro}"
    puts _membros
    _membros = _membros.split(",").compact.uniq.delete_if { |c| c == ""}.sort.join(",")
    _grupo.membros = _membros
    _grupo.save!
  end

  def self.delMembro(grupo,membro)
    _grupo = Grupo.find_or_create_by_nome(nomeGrupo)
    _membros = _grupo.membros || ""
    _membros << ",#{membro}"
    puts _membros
    _membros = _membros.split(",").compact.uniq.delete_if { |c| c == "" || c == membro}.sort.join(",")
    _grupo.membros = _membros
    _grupo.save!
  end
end
