class AddNewIndexToDailyGoodsStatistics < ActiveRecord::Migration[7.0]
  def change
    remove_index :daily_goods_statistics, [:region, :daily_goods_date, :sales_inventory_situation], unique: true,  name: 'daily_goods_statistics_unique_index'
    add_index :daily_goods_statistics, [:region, :daily_goods_date, :sales_inventory_situation, :manager_id], unique: true,  name: 'daily_goods_statistics_unique_index'
  end
end
