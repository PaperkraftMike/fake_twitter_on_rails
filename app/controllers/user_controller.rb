class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user = current_user
      flash[:notice] = "Your account was created!"
      redirect_to user_path(@user)
    else
      flash[:notice] = "There was a problem creating your account"
      redirect_to new_user_path
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      flash[:notice] = "Your account was created!"
    else
      flash[:notice] = "There was a problem creating your account"
    end
    redirect_to root_path

  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User was destroyed."
    else
      flash[:notice] = "There was a problem destroying the user."
    end
    redirect_to user_index_path
  end

  def show
    @user = User.find(params[:id])
    @following = Following.new
  end

  def index

  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :bio, :user_name, :city, :state)
  end

end