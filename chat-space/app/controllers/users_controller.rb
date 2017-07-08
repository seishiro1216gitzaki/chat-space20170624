class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    if curretnt_user.update(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
