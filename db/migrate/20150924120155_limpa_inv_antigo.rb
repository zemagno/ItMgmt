class LimpaInvAntigo < ActiveRecord::Migration
  def change
		drop_table :inventario_hws                
		drop_table :inventario_kpmg_sws           
		drop_table :inventario_kpmg_userids       
		drop_table :inventario_splunks_userids    
		drop_table :inventario_sws  
		drop_table :audit_hws    
		drop_table :audit_sws 
		drop_table :inventario_hostnames   
  end
end
