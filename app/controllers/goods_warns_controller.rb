class GoodsWarnsController < ApplicationController
  before_action :set_goods_warn, only: %i[ show edit update destroy ]

  # GET /goods_warns or /goods_warns.json
  def index
    @goods_warns = GoodsWarn.all
  end

  # GET /goods_warns/1 or /goods_warns/1.json
  def show
  end

  # GET /goods_warns/new
  def new
    @goods_warn = GoodsWarn.new
  end

  # GET /goods_warns/1/edit
  def edit
  end

  # POST /goods_warns or /goods_warns.json
  def create
    @goods_warn = GoodsWarn.new(goods_warn_params)

    respond_to do |format|
      if @goods_warn.save
        format.html { redirect_to goods_warn_url(@goods_warn), notice: "Goods warn was successfully created." }
        format.json { render :show, status: :created, location: @goods_warn }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @goods_warn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods_warns/1 or /goods_warns/1.json
  def update
    respond_to do |format|
      if @goods_warn.update(goods_warn_params)
        format.html { redirect_to goods_warn_url(@goods_warn), notice: "Goods warn was successfully updated." }
        format.json { render :show, status: :ok, location: @goods_warn }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @goods_warn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods_warns/1 or /goods_warns/1.json
  def destroy
    @goods_warn.destroy

    respond_to do |format|
      format.html { redirect_to goods_warns_url, notice: "Goods warn was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goods_warn
      @goods_warn = GoodsWarn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def goods_warn_params
      params.require(:goods_warn).permit(:goods_category, :goods_name, :Adequate_warning_value, :Insufficient_warning_value, :Below_warning_value, :remark)
    end
end
