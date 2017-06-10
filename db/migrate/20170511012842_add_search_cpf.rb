class AddSearchCpf < ActiveRecord::Migration
def change 
    execute %Q{ CREATE INDEX FuncCPF ON funcionarios (IdtCPF); }
  end
end
