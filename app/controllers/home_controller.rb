class HomeController < ApplicationController


  def index
    @enterprise_count = Enterprise.count
    @enterprise_shangchao_count = Enterprise.where('enterprise_category = ?', '重点商超').count
    @goods_data_submission_count_false = GoodsDataSubmission.where(report_status_today: false).count
    @goods_data_submission_count_true = GoodsDataSubmission.where(report_status_today: true).count
  end

end
