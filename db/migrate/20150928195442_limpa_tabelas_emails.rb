class LimpaTabelasEmails < ActiveRecord::Migration
  def change
  	    drop_table :email_externos                
		drop_table :google_accounts 
  end
end
