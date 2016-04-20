class AddIndexGrupos < ActiveRecord::Migration
  def change
    add_index :grupos, :nome
  end
end
