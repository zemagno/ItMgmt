class CreateAuditHws < ActiveRecord::Migration
  def change
    create_table :audit_hws do |t|
      t.string :hostname
      t.string :userid
      t.boolean :kpmg, :default => false
      t.boolean :inventario, :default => false
      t.boolean :cmdb, :default => false
      t.integer :score, :default => 0

      t.timestamps
    end
  end
end
