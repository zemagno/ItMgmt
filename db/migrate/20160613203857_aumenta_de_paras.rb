class AumentaDeParas < ActiveRecord::Migration
  def change
  	change_table :grupos do |t|
      t.string :para, :limit => 100
      t.string :tipo, :limit => 40
    end
  end
end
