class DailyGoodsStatisticsController < ApplicationController
  before_action :set_daily_goods_statistic, only: [:show, :edit, :update, :destroy]

  # GET /daily_goods_statistics
  def index
    if current_manager.category == '企业'
      @daily_goods_statistics = current_manager.daily_goods_statistics
    else
      @daily_goods_statistics = DailyGoodsStatistic.all
    end
    if current_manager.category == '地州商务局' && current_manager.region_id.present?
      @regions = current_manager.region.cities.pluck(:name)
    elsif current_manager.category == '地州商务局' && current_manager.region_id.blank?
      @regions = Region.first.cities.pluck(:name)
    else
      @regions = REGIONS
    end
    @daily_goods_statistics = @daily_goods_statistics.where('region = ?', params[:region]) if params[:region].present?
    @daily_goods_statistics = @daily_goods_statistics.where('sales_inventory_situation = ?', params[:sales_inventory_situation]) if params[:sales_inventory_situation].present?
    @daily_goods_statistics = @daily_goods_statistics.where('daily_goods_date = ?', params[:daily_goods_date]) if params[:daily_goods_date].present?
    @daily_goods_statistics = @daily_goods_statistics.order(daily_goods_date: :desc).page(params[:page] || 1).per(params[:per_page] || 10)
  end

  # GET /daily_goods_statistics/1
  def show
  end

  def download_csv
    headers = %w{所属区域 进销存 大米（吨） 	面粉（吨） 	食用油（吨） 	蔬菜（吨） 	猪肉（吨） 	羊肉（吨） 	鸡肉（吨） 	鸡蛋（吨） 	鲜奶（吨） 	方便面（吨） 日期}
    file = CSV.generate do |csv|
      csv << headers
      DailyGoodsStatistic.all.each_with_index do |daily_goods_statistic, index|
        row1 = [daily_goods_statistic.region, "库存量", daily_goods_statistic.rice, daily_goods_statistic.flour, daily_goods_statistic.oil, daily_goods_statistic.vegetables,
               daily_goods_statistic.pork, daily_goods_statistic.lamb, daily_goods_statistic.poultry, daily_goods_statistic.egg, daily_goods_statistic.milk,
               daily_goods_statistic.convenient_food, daily_goods_statistic.daily_goods_date.strftime("%Y-%m-%d")]
        row2 = [daily_goods_statistic.region, "销售量", daily_goods_statistic.rice_sales, daily_goods_statistic.flour_sales, daily_goods_statistic.oil_sales, daily_goods_statistic.vegetables_sales, daily_goods_statistic.pork_sales,
                daily_goods_statistic.lamb_sales, daily_goods_statistic.poultry_sales, daily_goods_statistic.egg_sales, daily_goods_statistic.milk_sales, daily_goods_statistic.convenient_food_sales, daily_goods_statistic.daily_goods_date.strftime("%Y-%m-%d")]
        row3 = [daily_goods_statistic.region, "进货量", daily_goods_statistic.rice_purchase, daily_goods_statistic.flour_purchase, daily_goods_statistic.oil_purchase, daily_goods_statistic.vegetables_purchase, daily_goods_statistic.pork_purchase,
                daily_goods_statistic.lamb_purchase, daily_goods_statistic.poultry_purchase, daily_goods_statistic.egg_purchase, daily_goods_statistic.milk_purchase, daily_goods_statistic.convenient_food_purchase, daily_goods_statistic.daily_goods_date.strftime("%Y-%m-%d")]
        Rails.logger.info "== row: #{row1.inspect}"
        Rails.logger.info "== row: #{row2.inspect}"
        Rails.logger.info "== row: #{row3.inspect}"
        csv << row1
        csv << row2
        csv << row3
      end
    end
    send_data file, :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment;filename=物资日统计.csv"
  end

  def upload_csv_page
  end

  def upload_csv
    tmp = params[:file]
    current_file_name = tmp.original_filename + Time.now.to_i.to_s
    uploaded_file = File.join("public/upload_files", current_file_name)
    File.open(uploaded_file, 'wb') do |f|
      f.write(tmp.read)
    end
    #读取csv文件
    csv_text = File.read(uploaded_file)
    csv = CSV.parse(csv_text,:headers => true)
    if current_manager.category == '企业'
      enterprise_id = current_manager.enterprises.last.id
    end
    csv.each_with_index do |row, index|
      DailyGoodsStatistic.create region: row['所属地州'],
        rice: row['大米（库存量）'], flour: row['面粉（库存量）'], oil: row['食用油（库存量）'], vegetables: row['蔬菜（库存量）'],
        pork: row['猪肉（库存量）'], beef: row['牛肉（库存量）'], lamb: row['羊肉（库存量）'], poultry: row['禽肉（库存量）'],
        egg: row['鸡蛋（库存量）'], milk: row['牛奶（库存量）'],
        convenient_food: row['方便面（库存量）'], rice_sales: row['大米（销售量）'], flour_sales: row['面粉（销售量）'], oil_sales: row['食用油（销售量）'], vegetables_sales: row['蔬菜（销售量）'],
        pork_sales: row['猪肉（销售量）'], beef_sales: row['牛肉（销售量）'], lamb_sales: row['羊肉（销售量）'], poultry_sales: row['禽肉（销售量）'], egg_sales: row['鸡蛋（销售量）'], milk_sales: row['牛奶（销售量）'],
        convenient_food_sales: row['方便面（销售量）'], rice_purchase: row['大米（进货量）'], flour_purchase: row['面粉（进货量）'], oil_purchase: row['食用油（进货量）'],
        vegetables_purchase: row['蔬菜（进货量）'], pork_purchase: row['猪肉（进货量）'], beef_purchase: row['牛肉（进货量）'], lamb_purchase: row['羊肉（进货量）'],
        milk: row['鲜奶（库存量）'], milk_sales: row['鲜奶（销售量）'], milk_purchase: row['鲜奶（进货量）'],
        milk: row['鲜奶（库存量）'], milk_sales: row['鲜奶（销售量）'], milk_purchase: row['鲜奶（进货量）'],
        fruit: row['水果（库存量）'], fruit_sales: row['水果（销售量）'], fruit_purchase: row['水果（进货量）'],
        poultry_purchase: row['禽肉（进货量）'], egg_purchase: row['鸡蛋（进货量）'], milk_purchase: row['牛奶（进货量）'], convenient_food_purchase: row['方便面（进货量）'],
        daily_goods_date: row['日期'], informant: row['填报人'], informant_tel: row['联系方式'],
        enterprise_id: enterprise_id
    end
    redirect_to daily_goods_statistics_url, notice: '操作成功'
  end

  # GET /daily_goods_statistics/new
  def new
    @daily_goods_statistic = DailyGoodsStatistic.new
  end

  # GET /daily_goods_statistics/1/edit
  def edit
  end

  # POST /daily_goods_statistics
  def create
    @daily_goods_statistic = DailyGoodsStatistic.new(daily_goods_statistic_params)
    @daily_goods_statistic.manager_id = current_manager.id

    if @daily_goods_statistic.save
      redirect_to @daily_goods_statistic, notice: 'Daily goods statistic was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /daily_goods_statistics/1
  def update
    if @daily_goods_statistic.update(daily_goods_statistic_params)
      redirect_to @daily_goods_statistic, notice: 'Daily goods statistic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /daily_goods_statistics/1
  def destroy
    @daily_goods_statistic.destroy
    redirect_to daily_goods_statistics_url, notice: 'Daily goods statistic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_goods_statistic
      @daily_goods_statistic = DailyGoodsStatistic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_goods_statistic_params
      params.require(:daily_goods_statistic).permit(:enterprise_id, :region, :sales_inventory_situation, :rice, :flour, :oil, :vegetables, :pork, :daily_goods_date,
                                                    :beef, :lamb, :poultry, :egg, :milk, :fruit, :convenient_food, :manager_id, :rice_sales, :informant, :informant_tel, :status,
                                                    :created_at, :updated_at, :flour_sales, :oil_sales, :pork_sales, :vegetables_sales, :beef_sales, :lamb_sales,
                                                    :poultry_sales, :egg_sales, :milk_sales, :fruit_sales, :convenient_food_sales, :rice_purchase, :flour_purchase,
                                                    :oil_purchase, :pork_purchase, :vegetables_purchase, :beef_purchase, :lamb_purchas, :poultry_purchase, :egg_purchase, :milk_purchase, :fruit_purchase, :convenient_food_purchase)
    end
end
