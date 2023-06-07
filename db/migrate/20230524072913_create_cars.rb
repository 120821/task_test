class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.integer :enterprise_id
      t.string :car_number
      t.string :weight
      t.string :driver_name
      t.string :driver_tel
      t.string :driver_id_card_number
      t.string :driver_address

      t.timestamps null: false
    end
  end
end
