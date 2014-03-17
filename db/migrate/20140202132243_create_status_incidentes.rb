class CreateStatusIncidentes < ActiveRecord::Migration
  def change
    create_table :status_incidentes do |t|
      t.string :status
      t.integer :ordem
      t.string :tipo

      t.timestamps
    end
    execute <<-SQL
insert into status_incidentes (status,ordem,tipo,created_at, updated_at) value("Aberto",      0 ,"ABERTO", now(), now());
insert into status_incidentes (status,ordem,tipo,created_at, updated_at) value("Cancelado",      9 ,"FECHADO",  now(), now());
insert into status_incidentes (status,ordem,tipo,created_at, updated_at) value("Executado com Sucesso",      9 ,"FECHADO",  now(), now());
insert into status_incidentes (status,ordem,tipo,created_at, updated_at) value("Nao Resolvido",      2 ,"ABERTO",  now(), now());
insert into status_incidentes (status,ordem,tipo,created_at, updated_at) value("Normalizado",      1 ,"FECHADO", now(), now());
insert into status_incidentes (status,ordem,tipo,created_at, updated_at) value("Resolvido",     9 ,"FECHADO", now(), now()); 
insert into status_incidentes (status,ordem,tipo,created_at, updated_at) value("Rollback",  0 ,"FECHADO", now(), now());
    SQL
  end
end