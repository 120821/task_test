class ManagersController < ApplicationController

  def index
    if current_manager.category == '管理员'
      @managers = Manager.all
    elsif current_manager.category == '地州商务局'
      @managers = current_manager.region.managers rescue []
    end
    #@managers = @managers.where('status = ?', params[:status]) if params[:status].present?
    status = ActiveRecord::Type::Boolean.new.deserialize(params[:status])
    Rails.logger.info "== #{status} #{params[:status]} #{status.present?}"
    @managers = @managers.where('status = ?', status)# if status.present?
    @managers = @managers.where('email = ?', params[:email]) if params[:email].present?
    @managers = @managers.order(created_at: :desc).page(params[:page] || 1).per(params[:per_page] || 10)
  end

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)

    if @manager.save
      flash[:success] = "Manager created successfully"
      redirect_to managers_path
    else
      flash.now[:danger] = "Failed to create Manager"
      render 'new'
    end
  end

  def create_one
    Manager.create!(email: params[:manager][:email], password: params[:manager][:password],
                    password_confirmation: params[:manager][:password],
                    owner: params[:manager][:owner], name: params[:manager][:name],
                    category: params[:manager][:category], region_id: params[:manager][:region_id],
                    status: params[:manager][:status])
    redirect_to managers_path
  end

  def create_bulk
    count = params[:count].to_i

    count.times do |i|
      email = Faker::Internet.email
      password = "password"

      Manager.create!(email: email, password: password, password_confirmation: password)
    end

    flash[:success] = "Bulk Managers created successfully"
    redirect_to managers_path
  end

  private

  def manager_params
    #params.require(:manager).permit(:email, :password, :password_confirmation)
    params.require(:manager).permit(:email, :owner, :email, :password, :category, :password_confirmation,
                                    :region_id, :status, :name)
  end
end
