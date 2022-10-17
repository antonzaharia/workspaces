class ProfileController < ApplicationController
  before_action :set_user

  def show; end
  def edit; end

  def update
    @user.update!(user_params)

    redirect_to profile_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :dob)
  end
  
  def set_user
    @user = User.find(params[:user_id])
  end
end
