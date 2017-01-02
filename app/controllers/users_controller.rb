class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:success] = "Logged in as #{@user.first_name} #{@user.last_name}"
    else
      flash.now[:error] = "Please try again."
      render :new
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
  end

end
