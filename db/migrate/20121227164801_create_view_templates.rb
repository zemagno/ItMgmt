class CreateViewTemplates < ActiveRecord::Migration
  def change
    create_table :view_templates do |t|
      t.string :name
      t.string :prefix
      t.boolean :partial
      t.text :source
      t.string :locale
      t.string :formats
      t.string :handlers

      t.timestamps
    end
  end
end
