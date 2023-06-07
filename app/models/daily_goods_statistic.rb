class DailyGoodsStatistic < ApplicationRecord
  belongs_to :enterprise, optional: true
  belongs_to :manager,  optional: true
  before_save :daily_goods_date
  def daily_goods_date
    self.daily_goods_date = Time.now.beginning_of_day
  end
end
