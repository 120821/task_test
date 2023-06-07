class AddInformantAndInformantTelToDailyGoodsStatistics < ActiveRecord::Migration[7.0]
  def change
    add_column :daily_goods_statistics, :informant, :string
    add_column :daily_goods_statistics, :informant_tel, :string
    add_column :daily_goods_statistics, :status, :boolean
  end
end
