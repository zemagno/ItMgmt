class CreateTipotasks < ActiveRecord::Migration
  def change
    create_table :tipotasks do |t|
      t.string :nome

      t.timestamps
    end
  end
end
