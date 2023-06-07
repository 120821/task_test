class CreateGoods < ActiveRecord::Migration[7.0]
  def change
    create_table :goods do |t|
      t.integer :enterprise_id
      t.integer :material_reserf_id
      t.string :administrative_division
      t.string :goods_type
      t.string :quantity
      t.string :person_in_charge
      t.string :person_in_charge_tel

      t.timestamps
    end
  end
end
