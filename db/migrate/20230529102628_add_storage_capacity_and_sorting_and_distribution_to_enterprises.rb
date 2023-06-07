class AddStorageCapacityAndSortingAndDistributionToEnterprises < ActiveRecord::Migration[7.0]
  def change
    add_column :enterprises, :storage_capacity, :string
    add_column :enterprises, :sorting_and_distribution, :boolean, default: false
  end
end
