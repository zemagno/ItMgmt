class CreateAreafornecedores < ActiveRecord::Migration
  def self.up
    create_table :areafornecedores do |t|
      t.string :area

      t.timestamps
    end
  end

  def self.down
    drop_table :areafornecedores
  end
end
