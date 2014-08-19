class AddMandatorioToDicdados < ActiveRecord::Migration
  def change
    add_column :dicdados, :mandatorio, :boolean
  end
end
