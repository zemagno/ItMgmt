class AddInternotoIdentities < ActiveRecord::Migration
  class AddInternotoIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :RMInterno, :string, :limit => 30
  end
end
end
