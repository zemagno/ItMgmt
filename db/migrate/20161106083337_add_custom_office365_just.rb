class AddCustomOffice365Just < ActiveRecord::Migration
  def change
  	add_column :funcionarios, :justificativaExtComOffice365, :string
  end
end
