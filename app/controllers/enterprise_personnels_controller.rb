require 'csv'
class EnterprisePersonnelsController < ApplicationController
  before_action :set_enterprise_personnel, only: %i[ show edit update destroy ]

  # GET /enterprise_personnels or /enterprise_personnels.json
  def index
    @enterprise_personnels = EnterprisePersonnel.all
    @enterprise_personnels = @enterprise_personnels.joins(:enterprise).where('enterprises.name = ?', params[:enterprise_name]) if params[:enterprise_name].present?
    @enterprise_personnels = @enterprise_personnels.where('enterprise_personnels.person_in_charge = ?', params[:person_in_charge]) if params[:person_in_charge].present?
    @categories = @enterprise_personnels.select('DISTINCT category').map(&:category)
    @enterprise_categories = Enterprise.select('DISTINCT enterprise_category').map(&:enterprise_category)
    @enterprise_personnels = @enterprise_personnels.where('enterprise_personnels.category = ?', params[:category]) if params[:category].present?
    @enterprise_personnels = @enterprise_personnels.where('enterprise_personnels.name = ?', params[:name]) if params[:name].present?
    @enterprise_personnels = @enterprise_personnels.where('enterprise_personnels.person_in_charge_tel = ?', params[:person_in_charge_tel]) if params[:person_in_charge_tel].present?
    @enterprise_personnels = @enterprise_personnels.order(id: :desc).page(params[:page] || 1).per(10)
    if current_manager.category == '地州商务局' && current_manager.region_id.present?
      @regions = current_manager.region.cities.pluck(:name)
    elsif current_manager.category == '地州商务局' && current_manager.region_id.blank?
      @regions = Region.first.cities.pluck(:name)
    else
      @regions = REGIONS
    end
  end

  def upload_csv_page
  end

  def download_csv
    headers = %w{姓名 企业名称 联系方式 人员类别 身份证号 家庭住址 紧急联系人}
    enterprise_personnels = ''
    if current_manager.category == '企业'
      enterprise_personnels = current_manager.enterprise_personnels.all
    else
      enterprise_personnels = EnterprisePersonnel.all
    end
    file = CSV.generate do |csv|
      csv << headers
      enterprise_personnels.all.each_with_index do |enterprise_personnel, index|
        row = [enterprise_personnel.name, enterprise_personnel.enterprise.try(:name), enterprise_personnel.tel, enterprise_personnel.category, enterprise_personnel.id_card, enterprise_personnel.family_address, enterprise_personnel.person_in_charge_tel]
        Rails.logger.info "== row: #{row.inspect}"
        csv << row
      end
    end
    send_data file, :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment;filename=企业人员.csv"
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
      enterprise_personnel = EnterprisePersonnel.new
      if row['企业名称'].present?
        enterprise = Enterprise.find_by name: row['企业名称']
        enterprise_personnel.name = row['姓名']
        enterprise_personnel.enterprise_id = enterprise.id if enterprise.present?
        enterprise_personnel.tel = row['联系方式']
        enterprise_personnel.category = row['人员类别']
        enterprise_personnel.id_card = row['身份证号码']
        enterprise_personnel.family_address = row['家庭住址']
        enterprise_personnel.person_in_charge_tel = row['紧急联系人']
        enterprise_personnel.save!
      end
    end
    redirect_to enterprise_personnels_url, notice: '操作成功'
  end

  # GET /enterprise_personnels/1 or /enterprise_personnels/1.json
  def show
  end

  # GET /enterprise_personnels/new
  def new
    @enterprise_personnel = EnterprisePersonnel.new
  end

  # GET /enterprise_personnels/1/edit
  def edit
  end

  # POST /enterprise_personnels or /enterprise_personnels.json
  def create
    @enterprise_personnel = EnterprisePersonnel.new(enterprise_personnel_params)

    respond_to do |format|
      if @enterprise_personnel.save
        format.html { redirect_to enterprise_personnel_url(@enterprise_personnel), notice: "Enterprise personnel was successfully created." }
        format.json { render :show, status: :created, location: @enterprise_personnel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enterprise_personnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enterprise_personnels/1 or /enterprise_personnels/1.json
  def update
    respond_to do |format|
      if @enterprise_personnel.update(enterprise_personnel_params)
        format.html { redirect_to enterprise_personnel_url(@enterprise_personnel), notice: "Enterprise personnel was successfully updated." }
        format.json { render :show, status: :ok, location: @enterprise_personnel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enterprise_personnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enterprise_personnels/1 or /enterprise_personnels/1.json
  def destroy
    @enterprise_personnel.destroy

    respond_to do |format|
      format.html { redirect_to enterprise_personnels_url, notice: "Enterprise personnel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enterprise_personnel
      @enterprise_personnel = EnterprisePersonnel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enterprise_personnel_params
      params.require(:enterprise_personnel).permit(:enterprise_id, :person_in_charge, :person_in_charge_tel, :enterprise_address, :material_type, :warehouse_address, :warehoues_type,
                                                   :inventory_quantity, :warehouse_manager, :warehouse_manager_tel, :tel, :email, :family_address, :id_card, :sex, :name, :category)
    end
end
