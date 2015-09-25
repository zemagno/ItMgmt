class AddStatusToCustoSoftware < ActiveRecord::Migration
  def change
    add_column :custo_softwares, :status, :integer
  end
end
