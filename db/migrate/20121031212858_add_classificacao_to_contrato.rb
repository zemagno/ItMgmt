class AddClassificacaoToContrato < ActiveRecord::Migration
  def self.up
    add_column :contratos, :classificacao, :string
  end

  def self.down
    remove_column :contratos, :classificacao
  end
end
