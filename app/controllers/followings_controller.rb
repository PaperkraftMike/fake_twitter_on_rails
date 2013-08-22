class FollowingsController
  def index
  end

  def new
  end

  def create
    @user = User.find(params[:id])
    @following = Following.new(following_params)
      if @following.save
        flash[:notice] = "You're now following #User.find({@following.follower_id})"
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
    params.require(:following).permit(:user_id, :follower_id)
  end


end