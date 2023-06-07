class AddColumnsToMaterialReserf < ActiveRecord::Migration[7.0]
  def change
    add_column :material_reserves, :city, :string
    add_column :material_reserves, :max_store, :string
    add_column :material_reserves, :longitude, :string, comment: '仓库经度'
    add_column :material_reserves, :latitude, :string, comment: '仓库纬度'
  end
end
