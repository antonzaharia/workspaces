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
    @user.icon = icon_params[:icon]

    respond_to do |format|
      if @user.save
        format.html { redirect_to profile_path(@user), allow_other_host: true, notice: 'Profile pic updated.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
