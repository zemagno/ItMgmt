class AdddataExecucaoToProducaoAds < ActiveRecord::Migration
   def change
    add_column :producao_ads, :dataExecucao, :date
   
  end
end
