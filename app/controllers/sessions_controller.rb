class SessionsController < ApplicationController
  def new
    # render template
  end
  
  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      sign_in user
      flash[:success] = "Signin successful"
      redirect_back_or user
    else
      flash.now[:error] = "Invalid credentials. Please try again."
      render "new"
    end
    
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
