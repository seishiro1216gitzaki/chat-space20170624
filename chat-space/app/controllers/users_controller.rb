class UsersController < ApplicationController

  def edit

  end

  def update
    if curretnt_user.update(user_params)
      redirect_to root_path

    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
