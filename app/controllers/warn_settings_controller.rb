class WarnSettingsController < ApplicationController
  before_action :set_warn_setting, only: %i[ show edit update destroy ]

  # GET /warn_settings or /warn_settings.json
  def index
    @warn_settings = WarnSetting.all
    @categories = @warn_settings.select('DISTINCT goods_category').map(&:goods_category) || []
    @names = @warn_settings.select('DISTINCT goods_name').map(&:goods_name) || []
    @warn_settings = @warn_settings.where('goods_name = ?', params[:goods_name]) if params[:goods_name].present?
    @warn_settings = @warn_settings.where('goods_category = ?', params[:goods_category]) if params[:goods_category].present?
    @warn_settings = @warn_settings.order(created_at: :desc).page(params[:page] || 1).per(params[:per_page] || 10)
  end

  # GET /warn_settings/1 or /warn_settings/1.json
  def show
  end

  # GET /warn_settings/new
  def new
    @warn_setting = WarnSetting.new
  end

  # GET /warn_settings/1/edit
  def edit
  end

  # POST /warn_settings or /warn_settings.json
  def create
    @warn_setting = WarnSetting.new(warn_setting_params)

    respond_to do |format|
      if @warn_setting.save
        format.html { redirect_to warn_setting_url(@warn_setting), notice: "操作成功" }
        format.json { render :show, status: :created, location: @warn_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warn_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warn_settings/1 or /warn_settings/1.json
  def update
    respond_to do |format|
      if @warn_setting.update(warn_setting_params)
        format.html { redirect_to warn_setting_url(@warn_setting), notice: "操作成功" }
        format.json { render :show, status: :ok, location: @warn_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @warn_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warn_settings/1 or /warn_settings/1.json
  def destroy
    @warn_setting.destroy

    respond_to do |format|
      format.html { redirect_to warn_settings_url, notice: "操作成功" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warn_setting
      @warn_setting = WarnSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warn_setting_params
      params.require(:warn_setting).permit(:goods_name, :goods_category, :max_warn, :min_warn, :remak, :danger_data, :simple_data, :warn_data)
    end
end
