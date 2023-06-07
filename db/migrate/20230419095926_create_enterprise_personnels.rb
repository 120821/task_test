class CreateEnterprisePersonnels < ActiveRecord::Migration[7.0]
  def change
    create_table :enterprise_personnels do |t|
      t.integer :enterprise_id
      t.string :person_in_charge
      t.string :person_in_charge_tel
      t.string :enterprise_address
      t.string :material_type
      t.string :warehouse_address
      t.string :warehoues_type
      t.string :inventory_quantity
      t.string :warehouse_manager
      t.string :warehouse_manager_tel

      t.timestamps
    end
  end
end
