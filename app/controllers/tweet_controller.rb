class TweetController < ApplicationController
  def new

  end

  def create
    @user = User.find(params[:user_id])
    @tweet = Tweet.new(tweet_params)
      if @tweet.save && @tweet << @user.tweets
        flash[:notice] = "Your tweet was successfully saved!"
      else
        flash[:notice] = "There was an error saving your tweet."
      end
      redirect_to user_path
  end

  def edit

  end

  def update
    
  end

  def index

  end

  def destroy
    @tweet.find(params[:id])
    @tweet.destroy
    redirect_to user_path
  end

  private
  def tweet_params
    params.require(:tweet).require(:text, :user_id)
  end
end