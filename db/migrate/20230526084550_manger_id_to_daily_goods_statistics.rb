class MangerIdToDailyGoodsStatistics < ActiveRecord::Migration[7.0]
  def change
    add_column :daily_goods_statistics, :manager_id, :integer
  end
end
