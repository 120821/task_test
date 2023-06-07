class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy, :reject, :approve]

  # GET /cars
  def index
    if current_manager.category == '企业'
      @cars = current_manager.cars
    else
      @cars = Car.all
    end

    if current_manager.category == '地州商务局' && current_manager.region_id.present?
      @regions = current_manager.region.cities.pluck(:name)
    elsif current_manager.category == '地州商务局' && current_manager.region_id.blank?
      @regions = Region.first.cities.pluck(:name)
    else
      @regions = REGIONS
    end
    @cars = @cars.where('name = ?', params[:name]) if params[:name].present?
    @cars = @cars.where('driver_name = ?', params[:driver_name]) if params[:driver_name].present?
    @cars = @cars.where('derver_id_card_number = ?', params[:derver_id_card_number]) if params[:derver_id_card_number].present?
    @cars = @cars.where('driver_name = ?', params[:driver_name]) if params[:driver_name].present?
    @cars = @cars.where('driver_tel = ?', params[:driver_tel]) if params[:driver_tel].present?
    @cars = @cars.order(created_at: :desc).page(params[:page] || 1).per(params[:per_page] || 10)
  end

  # GET /cars/1
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
    @car_numbers = current_manager.cars.select('DISTINCT car_number').map(&:car_number)
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  def create
    @car = Car.new(car_params)

    if @car.save
      case params[:name]
      when '创建并继续新建车辆'
        flash[:success] = 'Car created!'
        redirect_to new_car_path
      #when 'Save and new'
      #  flash[:success] = 'Car created!'
      #  redirect_to new_car_path
      else
        flash[:success] = 'Car created!'
      #  redirect_to cars_path
        redirect_to notice_goods_path
      end
    else
      render :new
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      redirect_to @car, notice: '操作成功'
    else
      render :edit
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
    redirect_to cars_url, notice: '操作成功'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:enterprise_id, :car_number, :weight, :driver_name, :driver_tel, :driver_id_card_number, :driver_address, :material_reserf_id)

    end
end
