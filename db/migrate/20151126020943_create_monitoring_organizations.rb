class CreateMonitoringOrganizations < ActiveRecord::Migration
  def change
    create_table :monitoring_organizations do |t|
      
      t.string :monitoring_name, null: false
      t.string :leader_name
      t.text :address
      t.string :monitoring_counter, null: false, default: '0'
      t.string :accreditation_num, null: false
      t.references :region

      t.timestamps
    end
    add_index :monitoring_organizations, :region_id
  end
end
