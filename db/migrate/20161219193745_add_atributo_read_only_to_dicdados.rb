class AddAtributoReadOnlyToDicdados < ActiveRecord::Migration
  def change
    add_column :dicdados, :bloqueado, :boolean
    # execute %Q{ update dicdados set bloqueado=false}
  end
end
