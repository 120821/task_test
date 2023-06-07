class AddColumnsToDailyGoodsStatistics < ActiveRecord::Migration[7.0]
  def change
    add_column :daily_goods_statistics, :beef, :string, comment: '牛肉'
    add_column :daily_goods_statistics, :lamb, :string, comment: '羊肉'
    add_column :daily_goods_statistics, :poultry, :string, comment: '禽肉'
    add_column :daily_goods_statistics, :egg, :string, comment: '鸡蛋'
    add_column :daily_goods_statistics, :milk, :string, comment: '牛奶'
    add_column :daily_goods_statistics, :fruit, :string, comment: '水果'
    add_column :daily_goods_statistics, :convenient_food, :string, comment: '方便食品'
  end
end
