class AddCmdToProducaoAd < ActiveRecord::Migration
  def change
    add_column :producao_ads, :cmd, :string
  end
end
