class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string   :login,  :limit => 30
      t.string   :ADUser,  :limit => 30
      t.date     :ADCriadoem
      t.date     :ADLastLogon
      t.date     :ADExpiraem
      t.date     :ADDataDesligamento
      t.string   :ADUsuarioTipo, :limit => 30
      t.string   :GoogleprimaryEmail, :limit => 30
      t.datetime :GooglelastLoginTime
      t.string   :GoogleorgUnitPath
      t.boolean  :Googlesuspended
      t.string   :GooglesuspensionReason
      t.string   :GoogleLicenses

      t.timestamps
    end
  end
end
