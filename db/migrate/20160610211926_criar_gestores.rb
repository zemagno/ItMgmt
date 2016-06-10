class CriarGestores < ActiveRecord::Migration
  def change
    create_table :gestores do |t|
		t.string :LoginUsuario
		t.string :NomeProfissional 
		t.string :LocalTrabalho 
		t.string :ESTADO 
		t.string :CIDADE 
		t.integer :Filial 
        t.timestamps
    end
  end
end
