class AddTipoToRelacionamentos < ActiveRecord::Migration
  def change
    add_column :relacionamentos, :tipo, :integer
  end
end
