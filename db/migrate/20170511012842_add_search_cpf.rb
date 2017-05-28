class AddSearchCpf < ActiveRecord::Migration
def change 
    execute %Q{ CREATE INDEX FuncCPF ON Funcionarios (IdtCPF); }
  end
end
