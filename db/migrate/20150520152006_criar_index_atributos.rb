class CriarIndexAtributos < ActiveRecord::Migration
  def up
  	add_index :atributos, :ci_id
  end

  def down
  end
end
