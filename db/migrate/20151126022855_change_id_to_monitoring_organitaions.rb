class ChangeIdToMonitoringOrganitaions < ActiveRecord::Migration
  def change
    rename_column :monitoring_organizations, :id, :id_monitoring
  end
end
