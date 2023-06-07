class CreateMaterialReserves < ActiveRecord::Migration[7.0]
  def change
    create_table :material_reserves do |t|
      t.string :region
      t.integer :enterprise_id
      t.string :enterprise_category
      t.string :goods_type
      t.string :storage_apacity
      t.string :person_in_charge
      t.string :tel
      t.string :warehouse_location

      t.timestamps
    end
  end
end
