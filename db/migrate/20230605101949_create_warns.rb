class CreateWarns < ActiveRecord::Migration[7.0]
  def change
    create_table :warns do |t|
      t.integer :region_id
      t.integer :material_reserf_id
      t.integer :enterprise_id
      t.string :enterprise_category
      t.string :goods_category
      t.string :unit
      t.string :max_warn
      t.string :min_warn
      t.string :warn_result

      t.timestamps
    end
  end
end
