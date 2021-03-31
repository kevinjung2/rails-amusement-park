class UsersController < ApplicationController
  def new

  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user
  end

  def show
    redirect_if_not_logged_in
    @user = current_user
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end
