class AddMaterialReserfNumberToWarns < ActiveRecord::Migration[7.0]
  def change
    add_column :warns, :material_reserf_number, :string
  end
end
