require 'csv'
class GoodsController < ApplicationController
  before_action :set_good, only: %i[ show edit update destroy ]
  before_action :select_cities, only: %i[ trade supply rate store]

  def charts
    @report_data = DailyGoodsStatistic.all
    @date_array = @report_data.pluck(:daily_goods_date).uniq
    @company_array = @report_data.pluck(:enterprise_id).uniq
  end
  def store
    @enterprises = Enterprise.where(enterprise_category: '重点商超').all
    @report_data = DailyGoodsStatistic.all
    @date_array = @report_data.pluck(:daily_goods_date).uniq
    @company_array = @report_data.pluck(:enterprise_id).uniq
  end

  # GET /goods or /goods.json
  def index
    if current_manager.category == '企业'
      @goods = current_manager.goods
    else
      @goods = Good.all
    end
    @goods = @goods.joins(:enterprise).where('enterprises.name = ?', params[:enterprise_name]) if params[:enterprise_name].present?
    @goods = @goods.where('person_in_charge = ?', params[:person_in_charge]) if params[:person_in_charge].present?
    @goods = @goods.where('person_in_charge_tel = ?', params[:person_in_charge_tel]) if params[:person_in_charge_tel].present?
    @total_count = @goods.count
    @goods = @goods.page(params[:page] || 1).per(10)
  end

  def chart_admin
    @goods = Good.all
    @goods = @goods.joins(:enterprise).where('enterprises.name = ?', params[:enterprise_name]) if params[:enterprise_name].present?
    @goods = @goods.where('person_in_charge = ?', params[:person_in_charge]) if params[:person_in_charge].present?
    @goods = @goods.where('person_in_charge_tel = ?', params[:person_in_charge_tel]) if params[:person_in_charge_tel].present?
    @goods = @goods.page(params[:page] || 1).per(10)
  end

  def chart_enterprise
  end

  def data
    @time = Time.now.in_time_zone('Beijing').strftime("%H:%M:%S")
    @day = Date.today.strftime("%Y/%m/%d")
    weekdays = ["星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"]
    @today_weekday = weekdays[Date.today.cwday - 1]
    @material_reserf = MaterialReserf.find 24
  end

  def trade
  end

  def dwonload_rate_csv
    headers = %w{'' 鲜奶	蔬菜	方便面	饮用水	民用口罩 消毒液	洗涤用品 香皂 卫生纸}
    file_name = ''
    file = CSV.generate do |csv|
      if params[:date] == 'day'
        file_name = '重点商品销量差额与增（降）幅环比'
      elsif params[:date] == 'week'
        file_name = '重点商品销量差额与增（降）幅周环比'
      end
      csv << headers
      row1= %w{3月4日销售量（吨) 59133 63.2 30366 8875.11	705	5136	3553	2847 17803}
      row2= %w{3月5日销售量（吨）55001 78.12 35079 1044 8.36 627 3425 4372 3010 22765}
      row3= %w{环比（增）降幅 -6.99	23.6	15.52 17.73 -11.06 	-33.31 	23.05 5.73 27.87}
      row4= %w{环比销售量差额 -4132 	14.92 	4713 	1573.25 	-78 	-1711.00 	819 	163 	4962}
      csv << row1
      csv << row2
      csv << row3
      csv << row4
    end
    send_data file, :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment;filename=#{file_name}.csv"
  end

  def dwonload_trade_csv
    headers = %w{企业名称 进场蔬菜总量 出场蔬菜总量}
    file = CSV.generate do |csv|
      csv << headers
      if params[:enterprise] == 'xinlian'
        row = ['新疆新联农', 50, 70]
      elsif params[:enterprise] == 'jiuding'
        row = ['新疆九鼎', 50, 70]
      end
      csv << row
    end
    send_data file, :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment;filename=进出场蔬菜总量.csv"
  end

  def supply
    if current_manager.category == '地州商务局' && current_manager.region_id.present?
      @regions = current_manager.region.cities.pluck(:name)
    elsif current_manager.category == '地州商务局' && current_manager.region_id.blank?
      @regions = Region.first.cities.pluck(:name)
    else
      @regions = REGIONS
    end
  end


  def rate
  end

  # GET /goods/1 or /goods/1.json
  def show
  end

  # GET /goods/new
  def new
    @good = Good.new
  end

  def notice
  end

  # GET /goods/1/edit
  def edit
  end

  # POST /goods or /goods.json
  def create
    @good = Good.new(good_params)

    respond_to do |format|
      if @good.save
        format.html { redirect_to good_url(@good), notice: "Good was successfully created." }
        format.json { render :show, status: :created, location: @good }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods/1 or /goods/1.json
  def update
    respond_to do |format|
      if @good.update(good_params)
        format.html { redirect_to good_url(@good), notice: "Good was successfully updated." }
        format.json { render :show, status: :ok, location: @good }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1 or /goods/1.json
  def destroy
    @good.destroy

    respond_to do |format|
      format.html { redirect_to goods_url, notice: "Good was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_good
      @good = Good.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def good_params
      params.require(:good).permit(:enterprise_id, :material_reserf_id, :administrative_division, :goods_type, :quantity, :person_in_charge, :person_in_charge_tel)
    end

    def select_cities
      if current_manager.category == '地州商务局' && current_manager.region_id.present?
        @regions = current_manager.region.cities.pluck(:name)
      elsif current_manager.category == '地州商务局' && current_manager.region_id.blank?
        @regions = Region.first.cities.pluck(:name)
      else
        @regions = REGIONS
      end
    end
end
