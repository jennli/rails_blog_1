class UsersController < ApplicationController

  def create
    @user = User.new user_params

    if @user.save
      login(@user)
      redirect_to root_path, notice: "Account created!"
    else
      flash[:alert] = "Error creating user. see error below"
      render :new
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
