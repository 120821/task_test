class AddRegionIdToManagers < ActiveRecord::Migration[7.0]
  def change
    add_column :managers, :region_id, :integer
  end
end
