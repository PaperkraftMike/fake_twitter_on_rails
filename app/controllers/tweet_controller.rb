class TweetController < ApplicationController
  def new

  end

  def create

  end

  def edit

  end

  def update
    
  end

  def index

  end

  def destroy

  end

  private
  def tweet_params
    params.require(:tweet).require(:text, :user_id)
  end
end