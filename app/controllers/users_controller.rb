class UsersController < ApplicationController

  before_filter

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to questions_path
    else
      render "new"
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:user])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
