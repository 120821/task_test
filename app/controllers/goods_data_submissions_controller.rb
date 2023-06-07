class GoodsDataSubmissionsController < ApplicationController
  before_action :set_goods_data_submission, only: [:show, :edit, :update, :destroy, :update_status]

  # GET /goods_data_submissions
  def index
    @categories = Enterprise.select('DISTINCT enterprise_category').map(&:enterprise_category)
    if current_manager.category == '企业'
      @goods_data_submissions = current_manager.goods_data_submissions
    else
      @goods_data_submissions = GoodsDataSubmission.all
    end
    @goods_data_submission = GoodsDataSubmission.where(report_status_today: false)
    @goods_data_submissions = @goods_data_submissions.where('created_at <= ?', params[:created_at]) if params[:created_at].present?
    @goods_data_submissions = @goods_data_submissions.where('region = ?', params[:region]) if params[:region].present?
    @goods_data_submissions = @goods_data_submissions.joins(:enterprise)
      .where('goods_data_submissions.enterprise_category = ?', params[:enterprise_category])
      .distinct if params[:enterprise_category].present?

    if current_manager.category == '地州商务局' && current_manager.region_id.present?
      @regions = current_manager.region.cities.pluck(:name)
    elsif current_manager.category == '地州商务局' && current_manager.region_id.blank?
      @regions = Region.first.cities.pluck(:name)
    else
      @regions = REGIONS
    end
    @goods_data_submissions = @goods_data_submissions.joins(:enterprise).where('enterprises.name = ?', params[:enterprise_name]) if params[:enterprise_name].present?
    @goods_data_submissions = @goods_data_submissions.where('report_status_today = ?', ActiveRecord::Type::Boolean.new.cast(params[:report_status_today])) if params[:report_status_today].present?
    @goods_data_submissions = @goods_data_submissions.joins(:enterprise).where('enterprises.name = ?', params[:name]) if params[:name].present?
    @goods_data_submissions = @goods_data_submissions.order(id: :desc).page(params[:page] || 1).per(params[:per_page] || 10)
  end

  # GET /goods_data_submissions/1
  def show
  end

  # GET /goods_data_submissions/new
  def new
    @goods_data_submission = GoodsDataSubmission.new
  end

  # GET /goods_data_submissions/1/edit
  def edit
  end

  def all_update_status
    current_manager.goods_data_submissions.all.map{ |e| e.update report_status_today: true}
    redirect_to goods_data_submissions_url
  end
  def update_status
    @goods_data_submission.update! report_status_today: true
    redirect_to goods_data_submissions_url
  end

  # POST /goods_data_submissions
  def create
    @goods_data_submission = GoodsDataSubmission.new(goods_data_submission_params)
    @goods_data_submission.manager_id = current_manager.id

    if @goods_data_submission.save
      redirect_to @goods_data_submission, notice: '操作成功'
    else
      render :new
    end
  end

  # PATCH/PUT /goods_data_submissions/1
  def update
    if @goods_data_submission.update(goods_data_submission_params)
      redirect_to @goods_data_submission, notice: '操作成功'
    else
      render :edit
    end
  end

  # DELETE /goods_data_submissions/1
  def destroy
    @goods_data_submission.destroy
    redirect_to goods_data_submissions_url, notice: '操作成功'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goods_data_submission
      @goods_data_submission = GoodsDataSubmission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def goods_data_submission_params
      params.require(:goods_data_submission).permit(:enterprise_id, :last_reported_time, :reported_data, :report_person, :report_person_tel, :report_status_today, :operations, :region, :goods_category, :enterprise_category, :manager_id, :created_at, :updated_at)
    end
end
