class AddEmailAndImagesToEnterprises < ActiveRecord::Migration[7.0]
  def change
    add_column :enterprises, :email, :string
    add_column :enterprises, :business_license, :binary
    add_column :enterprises, :business_processing_license, :binary
    add_column :enterprises, :food_distribution_license, :binary
    add_column :enterprises, :warehouse_photos_one, :binary
    add_column :enterprises, :warehouse_photos_two, :binary
    add_column :enterprises, :warehouse_photos_three, :binary
  end
end
