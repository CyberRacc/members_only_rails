class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # If the user is saved successfully than respond with a success message
    if @user.save
      flash[:success] = "Welcome to the site!"
      redirect_to root_path
    else
      # If the user is not saved successfully than respond with an error message
      flash[:error] = "There was a problem creating your account."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
