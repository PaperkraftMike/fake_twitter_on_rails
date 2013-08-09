class TweetController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @tweet = Tweet.new(:text => tweet_params)
      if @tweet.save && @user.tweets << @tweet
        flash[:notice] = "Your tweet was successfully saved!"
      else
        flash[:notice] = "There was an error saving your tweet."
      end
      redirect_to user_path(@user)
  end

  def edit
    @user = User.find(params[:user_id])
    @tweet = Tweet.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @tweet = Tweet.find(params[:id])
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
    params.require(:tweet).require(:text)
  end
end