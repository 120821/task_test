class AddImagesToMaterialReserves < ActiveRecord::Migration[7.0]
  def change
    add_column :material_reserves, :image_one, :binary
    add_column :material_reserves, :image_two, :binary
    add_column :material_reserves, :image_three, :binary
  end
end
