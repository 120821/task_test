class AddColumnSortingAndDistributionToMaterialReserves < ActiveRecord::Migration[7.0]
  def change
    add_column :material_reserves, :sorting_and_distribution, :boolean, default: false
  end
end
