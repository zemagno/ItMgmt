class CreateSchedulers < ActiveRecord::Migration
  def change
    create_table :schedulers do |t|
      t.string :job
      t.string :when

      t.timestamps
    end
  end
end
