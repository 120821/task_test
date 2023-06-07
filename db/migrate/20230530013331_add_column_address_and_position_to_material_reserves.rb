class AddColumnAddressAndPositionToMaterialReserves < ActiveRecord::Migration[7.0]
  def change
    add_column :material_reserves, :warehouse_location_two, :string
    add_column :material_reserves, :latitude_two, :string
    add_column :material_reserves, :longitude_two, :string
    add_column :material_reserves, :image_four, :binary
    add_column :material_reserves, :image_five, :binary
    add_column :material_reserves, :image_six, :binary
    add_column :material_reserves, :image_seven, :binary
    add_column :material_reserves, :image_eight, :binary
    add_column :material_reserves, :image_nine, :binary
    add_column :material_reserves, :image_ten, :binary
  end
end
