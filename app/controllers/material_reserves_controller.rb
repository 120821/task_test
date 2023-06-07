class MaterialReservesController < ApplicationController
  before_action :set_material_reserf, only: %i[ show edit update destroy ]

  # GET /material_reserves or /material_reserves.json
  def index
    if current_manager.category == '企业'
      @goods = current_manager.material_reserves
    else
      @goods = Good.all
    end
    if current_manager.category == '地州商务局' && current_manager.region_id.present?
      @regions = current_manager.region.cities.pluck(:name)
    elsif current_manager.category == '地州商务局' && current_manager.region_id.blank?
      @regions = Region.first.cities.pluck(:name)
    else
      @regions = REGIONS
    end
    @material_reserves = MaterialReserf.all
    @material_reserves = @material_reserves.where('created_at <= ?', params[:created_at]) if params[:created_at].present?
    @material_reserves = @material_reserves.where('material_reserves.region = ?', params[:region]) if params[:region].present?
    @material_reserves = @material_reserves.joins(:enterprise).where('enterprises.name = ?', params[:name]) if params[:name].present?
    @material_reserves = @material_reserves.order(id: :desc).page(params[:page] || 1).per(params[:per_page] || 10)
  end

  # GET /material_reserves/1 or /material_reserves/1.json
  def show
  end

  # GET /material_reserves/new
  def new
    @material_reserf = MaterialReserf.new
  end

  # GET /material_reserves/1/edit
  def edit
  end

  # POST /material_reserves or /material_reserves.json
  def create
    @material_reserf = MaterialReserf.new(material_reserf_params)

    if @material_reserf.save
      case params[:name]
      when '创建并继续新建仓库'
        flash[:success] = 'Car created!'
        redirect_to new_material_reserf_path(number: 2)
      #when 'Save and new'
      #  flash[:success] = 'Car created!'
      #  redirect_to new_car_path
      else
        flash[:success] = 'Car created!'
      #  redirect_to cars_path
        redirect_to new_car_path(number: 3)
      end
    else
      render :new
    end
  end

  # PATCH/PUT /material_reserves/1 or /material_reserves/1.json
  def update
    if @material_reserf.update(material_reserf_params)
      redirect_to @material_reserf, notice: '操作成功'
    else
      render :edit
    end
  end

  # DELETE /material_reserves/1 or /material_reserves/1.json
  def destroy
    @material_reserf.destroy

    redirect_to material_reserves_url, notice: '操作成功'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_reserf
      @material_reserf = MaterialReserf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def material_reserf_params
      params.require(:material_reserf).permit(:region,  :warehouse_location_two, :enterprise_id, :enterprise_category, :goods_type, :storage_apacity, :person_in_charge, :tel, :warehouse_location, :city, :max_store, :longitude, :latitude, :image_one, :image_two, :longitude_two, :latitude_two, :image_three, :sorting_and_distribution, :image_four, :image_five, :image_six, :image_seven, :image_eight, :image_nine, :image_ten)
    end
end
