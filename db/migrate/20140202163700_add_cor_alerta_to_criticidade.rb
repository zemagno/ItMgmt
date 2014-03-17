class AddCorAlertaToCriticidade < ActiveRecord::Migration
  def change
    add_column :criticidades, :alertacor, :string
  end
end
