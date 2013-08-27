class FollowingsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find(session[:user_id])
    @following = Following.new(user_id: session[:user_id], follower_id: params[:user_id])
      if @following.save && @user.followings << @following
        flash[:notice] = "You're now following #{User.find(@following.follower_id).user_name}"
      else
        flash[:notice] = "There was a problem"
      end
      redirect_to user_path(@user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def following_params
    params.require(:follow).permit(:user_id, :follower_id)
  end

end