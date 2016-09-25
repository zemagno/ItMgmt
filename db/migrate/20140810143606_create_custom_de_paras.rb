class CreateCustomDeParas < ActiveRecord::Migration
  def change
    create_table :custom_de_paras do |t|
      t.string :de, :limit => 100
      t.string :para, :limit => 100
      t.string :tipo,:limit => 30

      t.timestamps
    end
  end
end
