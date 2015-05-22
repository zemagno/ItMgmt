class AddComentariosToDicdados < ActiveRecord::Migration
  def change
  	add_column :dicdados, :comentarios, :text 
  end
end
