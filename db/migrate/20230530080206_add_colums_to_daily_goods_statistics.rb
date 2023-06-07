class AddColumsToDailyGoodsStatistics < ActiveRecord::Migration[7.0]
  def change
    add_column :daily_goods_statistics, :rice_sales, :string
    add_column :daily_goods_statistics, :flour_sales, :string
    add_column :daily_goods_statistics, :oil_sales, :string
    add_column :daily_goods_statistics, :pork_sales, :string
    add_column :daily_goods_statistics, :vegetables_sales, :string
    add_column :daily_goods_statistics, :beef_sales, :string, comment: '牛肉'
    add_column :daily_goods_statistics, :lamb_sales, :string, comment: '羊肉'
    add_column :daily_goods_statistics, :poultry_sales, :string, comment: '禽肉'
    add_column :daily_goods_statistics, :egg_sales, :string, comment: '鸡蛋'
    add_column :daily_goods_statistics, :milk_sales, :string, comment: '牛奶'
    add_column :daily_goods_statistics, :fruit_sales, :string, comment: '水果'
    add_column :daily_goods_statistics, :convenient_food_sales, :string, comment: '方便食品'
    add_column :daily_goods_statistics, :rice_purchase, :string
    add_column :daily_goods_statistics, :flour_purchase, :string
    add_column :daily_goods_statistics, :oil_purchase, :string
    add_column :daily_goods_statistics, :pork_purchase, :string
    add_column :daily_goods_statistics, :vegetables_purchase, :string
    add_column :daily_goods_statistics, :beef_purchase, :string, comment: '牛肉'
    add_column :daily_goods_statistics, :lamb_purchase, :string, comment: '羊肉'
    add_column :daily_goods_statistics, :poultry_purchase, :string, comment: '禽肉'
    add_column :daily_goods_statistics, :egg_purchase, :string, comment: '鸡蛋'
    add_column :daily_goods_statistics, :milk_purchase, :string, comment: '牛奶'
    add_column :daily_goods_statistics, :fruit_purchase, :string, comment: '水果'
    add_column :daily_goods_statistics, :convenient_food_purchase, :string, comment: '方便食品'
  end
end
