class AddLogCis < ActiveRecord::Migration
  def change
    create_table :log_cis do |t|
      t.integer :ci_id
      t.string  :userid
      t.date    :data
      t.string  :historico

      t.timestamps
    end
  end
end


