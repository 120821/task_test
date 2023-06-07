class AddColumnNameAndOwnerToManagers < ActiveRecord::Migration[7.0]
  def change
    add_column :managers, :name, :string
    add_column :managers, :owner, :string
    add_column :managers, :status, :boolean
  end
end
