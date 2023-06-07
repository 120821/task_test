class WarnsController < ApplicationController
  before_action :set_warn, only: %i[ show edit update destroy ]

  # GET /warns or /warns.json
  def index
    @warns = Warn.all
    @categories = @warns.select('DISTINCT goods_category').map(&:goods_category) || []
    @numbers = @warns.select('DISTINCT material_reserf_number').map(&:material_reserf_number) || []
    @warns = @warns.where('material_reserf_number = ?', params[:material_reserf_number]) if params[:material_reserf_number].present?
    @warns = @warns.where('goods_category = ?', params[:goods_category]) if params[:goods_category].present?
    @warns = @warns.where('warn_result = ?', params[:warn_result]) if params[:warn_result].present?
    @warns = @warns.order(created_at: :desc).page(params[:page] || 1).per(params[:per_page] || 10)
  end

  # GET /warns/1 or /warns/1.json
  def show
  end

  # GET /warns/new
  def new
    @warn = Warn.new
  end

  # GET /warns/1/edit
  def edit
  end

  # POST /warns or /warns.json
  def create
    @warn = Warn.new(warn_params)

    respond_to do |format|
      if @warn.save
        format.html { redirect_to warn_url(@warn), notice: "操作成功" }
        format.json { render :show, status: :created, location: @warn }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warns/1 or /warns/1.json
  def update
    respond_to do |format|
      if @warn.update(warn_params)
        format.html { redirect_to warn_url(@warn), notice: "操作成功" }
        format.json { render :show, status: :ok, location: @warn }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @warn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warns/1 or /warns/1.json
  def destroy
    @warn.destroy

    respond_to do |format|
      format.html { redirect_to warns_url, notice: "操作成功"}
      format.json { head :no_content }
    end
  end

  def download_csv
    headers = %w{所属地州 仓库编号 企业分类 物资类型 单位 最高预警量 最低预警量 数值结果}
    file = CSV.generate do |csv|
      csv << headers
      Warn.all.each_with_index do |warn, index|
        row = [warn.region.try(:name), warn.material_reserf_number, warn.enterprise.try(:enterprise_category),
               warn.goods_category, warn.unit, warn.max_warn, warn.min_warn, warn.warn_result]
        Rails.logger.info "== row: #{row.inspect}"
        csv << row
      end
    end
    send_data file, :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment;filename=物资预警.csv"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warn
      @warn = Warn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warn_params
      params.require(:warn).permit(:region_id, :material_reserf_id, :material_reserf_number, :enterprise_id, :enterprise_category, :goods_category, :unit, :max_warn, :min_warn, :warn_result)
    end
end
