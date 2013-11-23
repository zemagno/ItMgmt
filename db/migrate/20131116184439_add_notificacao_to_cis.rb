class AddNotificacaoToCis < ActiveRecord::Migration
  def change
    add_column :cis, :notificacao, :string
  end
end
