class CreateTemplateSurveys < ActiveRecord::Migration
  def change
    create_table :template_surveys do |t|
      t.string :nome
      t.text :formulario

      t.timestamps
    end
  end
end
