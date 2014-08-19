class AddRegexToDicdados < ActiveRecord::Migration
  def change
    add_column :dicdados, :regex, :string
  end
end
