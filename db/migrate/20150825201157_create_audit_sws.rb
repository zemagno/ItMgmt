class CreateAuditSws < ActiveRecord::Migration
  def change
    create_table :audit_sws do |t|
      t.string :software
      t.string :userid
      t.boolean :kpmg, :default => false
      t.boolean :sccm, :default => false
      t.boolean :cmdb, :default => false
      t.integer :score, :default => 0

      t.timestamps
    end
  end
end
