class ManagerPasswordsController < ApplicationController
  before_action :authenticate_manager!

  def edit_password
    @manager = current_manager
  end

  def update_password
    @manager = Manager.find params[:id]
    #判断密码是否正确,是否有修改权限,密码正确，可以进行修改
    #if params[:old_password] == @manager.password
    if @manager.valid_password?(params[:old_password])
      #valid_password?('password123')
      #判断新密码是否输入一致,输入一致，保存新密码
      if params[:new_password] == params[:repeat_new_password]
        @manager.password = params[:new_password]
        @manager.save!

        redirect_back fallback_location: '/', notice: '操作成功'
      else
        redirect_back fallback_location: edit_password_manager_passwords_path, notice: '密码输入不一致'
      end
    else
      redirect_back fallback_location:  edit_password_manager_passwords_path, notice: '密码错误'
    end
  end
end
