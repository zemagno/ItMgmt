class AlteraDataLogCis < ActiveRecord::Migration
  def change
  	change_column :log_cis, :data, :datetime
  end
end
