class AddFromToMailings < ActiveRecord::Migration
  def change
    add_column :mailings, :from, :string
  end
end
