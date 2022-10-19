class ProfileController < ApplicationController
  before_action :set_user

  def show; end
  def edit; end
  def delete; end

  def update
    @user.update!(user_params)

    redirect_to profile_path(@user)
  end

  def update_icon
    @user.update!(icon_params)

    redirect_to profile_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :dob)
  end

  def icon_params
    params.require(:user).permit(:icon)
  end
  
  def set_user
    @user = User.find(params[:user_id])
  end
end
