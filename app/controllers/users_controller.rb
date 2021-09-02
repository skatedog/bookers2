class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @new_book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
  end

  def edit
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end