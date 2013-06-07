class AddComentarioToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :comentario, :text
  end
end
