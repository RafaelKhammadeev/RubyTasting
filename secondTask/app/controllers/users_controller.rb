class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    users_params = params.require(:users).permit(:name, :nickname, :email)
    User.create(users_params)
    redirect_to root_path
  end
end
