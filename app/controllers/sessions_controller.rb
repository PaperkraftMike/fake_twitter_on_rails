class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user 
      session[:user_id] = user.id
      redirect_to user_path(user.id), :notice => "You're logged in!"
    else
      flash.now.alert = "You're email and/or password were invalid"
      render "new"
    end
  end





end