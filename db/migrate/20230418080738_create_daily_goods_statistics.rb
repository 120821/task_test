class CreateDailyGoodsStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_goods_statistics do |t|
      t.integer :enterprise_id
      t.string :region
      t.string :sales_inventory_situation
      t.integer :rice
      t.integer :flour
      t.integer :oil
      t.integer :vegetables
      t.integer :pork

      t.timestamps
    end
  end
end
