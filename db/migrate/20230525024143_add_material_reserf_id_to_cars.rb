class AddMaterialReserfIdToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :material_reserf_id, :integer
  end
end
