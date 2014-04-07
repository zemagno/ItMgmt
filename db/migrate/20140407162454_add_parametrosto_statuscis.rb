class AddParametrostoStatuscis < ActiveRecord::Migration
  def change
  	add_column :statuscis, :parametro, :string
  end

end
