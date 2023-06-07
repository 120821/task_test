class CreateEnterprises < ActiveRecord::Migration[6.1]
  def change
    create_table :enterprises do |t|
      t.string :name
      t.string :region
      t.string :enterprise_category
      t.string :goods_category
      t.string :person_in_charge
      t.string :person_in_charge_tel
      t.string :person_in_charge_of_data_entry
      t.string :person_in_charge_of_data_entry_tel

      t.timestamps null: false
    end
  end
end
