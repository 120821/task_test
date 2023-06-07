class EnterprisesController < ApplicationController
  before_action :set_enterprise, only: [:show, :edit, :update, :destroy, :reject, :approve]

  # GET /enterprises
  def list
    @enterprises = current_manager.enterprises
    @enterprises = @enterprises.order(created_at: :desc).page(params[:page] || 1).per(params[:per_page] || 10)
  end

  def index
    if current_manager.category == '企业'
      @enterprises = current_manager.enterprises
    else
      @enterprises = Enterprise.all
    end
    @enterprises = @enterprises.where('enterprise.region = ?', params[:region]) if params[:region].present?
    @enterprises = @enterprises.where('name = ?', params[:name]) if params[:name].present?
    @categories = @enterprises.select('DISTINCT enterprise_category').map(&:enterprise_category)
    @enterprises = @enterprises.where('enterprise_category = ?', params[:enterprise_category]) if params[:enterprise_category].present?
    @enterprises = @enterprises.where('person_in_charge = ?', params[:person_in_charge]) if params[:person_in_charge].present?
    @enterprises = @enterprises.where('person_in_charge_tel = ?', params[:person_in_charge_tel]) if params[:person_in_charge_tel].present?
    @enterprises = @enterprises.order(created_at: :desc).page(params[:page] || 1).per(params[:per_page] || 10)
  end

  # GET /enterprises/1
  def show
    @material_reserves = @enterprise.material_reserves.all
    @cars = @enterprise.cars.all
  end

  def show_page
    @enterprise = Enterprise.find 18
    @material_reserves = @enterprise.material_reserves.all
    @cars = @enterprise.cars.all
  end

  def approval
    if current_manager.category == '企业'
      @enterprises = current_manager.enterprises.where('status = ?', '待处理').all
    else
      @enterprises = Enterprise.where('status = ?', '待处理').all
    end
    @enterprises = @enterprises.where('region = ?', params[:region]) if params[:region].present?
    @enterprises = @enterprises.where('name = ?', params[:name]) if params[:name].present?
    @categories = @enterprises.select('DISTINCT enterprise_category').map(&:enterprise_category)
    @enterprises = @enterprises.where('enterprise_category = ?', params[:enterprise_category]) if params[:enterprise_category].present?
    @enterprises = @enterprises.where('person_in_charge = ?', params[:person_in_charge]) if params[:person_in_charge].present?
    @enterprises = @enterprises.where('person_in_charge_tel = ?', params[:person_in_charge_tel]) if params[:person_in_charge_tel].present?
    @enterprises = @enterprises.order(created_at: :desc).page(params[:page] || 1).per(params[:per_page] || 10)
  end

  # GET /enterprises/new
  def new
    @enterprise = Enterprise.new
  end

  # GET /enterprises/1/edit
  def edit
  end

  def reject
    @enterprise.update status: '已拒绝'
    redirect_to enterprise_url(@enterprise), notice: "操作成功"
  end

  def approve
    @enterprise.update status: '已通过'
    redirect_to enterprise_url(@enterprise), notice: "操作成功"
  end
  # POST /enterprises
  def create
    @enterprise = Enterprise.new(enterprise_params)
    @enterprise.manager_id = current_manager.id
    @enterprise.status = "待处理"

    if @enterprise.save
      redirect_to new_material_reserf_path(number: 2)
    else
      render :new
    end
  end

  # PATCH/PUT /enterprises/1
  def update
    if params[:business_license].present?
      @enterprise.business_license.attach(params[:business_license])
    end
    if params[:business_processing_license].present?
      @enterprise.business_processing_license.attach(params[:business_processing_license])
    end
    if params[:food_distribution_license].present?
      @enterprise.food_distribution_license.attach(params[:food_distribution_license])
    end

    if @enterprise.update(enterprise_params)
      redirect_to @enterprise, notice: '操作成功'
    else
      render :edit
    end
  end

  # DELETE /enterprises/1
  def destroy
    @enterprise.destroy
    redirect_to enterprises_url, notice: '操作成功'
  end

  def download_csv
    headers = %w{企业名称 所属地州 企业分类 物资分类 企业负责人 负责人联系方式 邮箱 营业执照 经营加工许可证 食品流通许可证}
    enterprises = ''
    if current_manager.category == '企业'
      enterprises = current_manager.enterprises.all
    else
      enterprises = Enterprise.all
    end
    file = CSV.generate do |csv|
      csv << headers
      enterprises.all.each_with_index do |enterprise, index|
        row = [enterprise.name, enterprise.region, enterprise.enterprise_category, enterprise.goods_category,
               enterprise.person_in_charge, enterprise.person_in_charge_tel, enterprise.email,
               (request.base_url+enterprise.business_license.url if enterprise.business_license.present?),
               (request.base_url+enterprise.business_processing_license.url if enterprise.business_processing_license.present?),
               (request.base_url+enterprise.food_distribution_license.url if enterprise.food_distribution_license.present?)]
        Rails.logger.info "== row: #{row.inspect}"
        csv << row
      end
    end
    send_data file, :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment;filename=企业.csv"
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
    csv.each_with_index do |row, index|
      enterprise = Enterprise.new
      if row['保供企业名称'].present?
        enterprise.name = row['保供企业名称']
        enterprise.person_in_charge_tel = row['负责人手机号']
        enterprise.person_in_charge = row['负责人姓名']
        enterprise.enterprise_category = row['保供企业分类']
        enterprise.storage_capacity = row['存储能力（吨)']
        enterprise.status = row['审批状态']
        enterprise.manager_id = current_manager.id
        # 存储能力（吨)  有无分拣配送中心
        enterprise.save!
      end
    end
    redirect_to approval_enterprises_url, notice: '操作成功'
  end

  def upload_csv_page
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enterprise
      @enterprise = Enterprise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enterprise_params
      params.require(:enterprise).permit(:name, :region, :enterprise_category, :goods_category, :person_in_charge, :person_in_charge_tel, :person_in_charge_of_data_entry, :person_in_charge_of_data_entry_tel,
                                         :business_license, :email, :business_processing_license, :food_distribution_license, :warehouse_photos_one, :warehouse_photos_two, :warehouse_location_two, :warehouse_photos_three, :status, :manager_id, :legal_person_image,
                                        :storage_capacity, :sorting_and_distribution)
    end
end
