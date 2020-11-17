class SessionsController < ApplicationController
  def new 
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      redirect_to '/'
      session[:user_id] = user.id
    else
      session[:user_id] = nil
      redirect_to '/login'
    end
  end
  
  def destroy 
    session[:user_id] = nil
    redirect_to '/login'
  end
  
end
