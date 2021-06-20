class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]= "User added successfully"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User edited successfully"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User deleted successfully"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email)
  end

  def set_user
    @user = User.find(params[:id])
  end


end