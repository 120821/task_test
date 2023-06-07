class AddUniqueIndexToDailyGoodsStatistics < ActiveRecord::Migration[7.0]
  def change
    add_column :daily_goods_statistics, :daily_goods_date, :datetime
    add_index :daily_goods_statistics, [:region, :daily_goods_date, :sales_inventory_situation], unique: true,  name: 'daily_goods_statistics_unique_index'
  end
end
