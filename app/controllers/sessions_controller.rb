class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    p user, session_params[:password]
    if user&.authenticate(session_params[:password])
      log_in user
      remember user
      redirect_to user
    else
      flash.now[:danger] = 'Totally Wrong!'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private
  
  def session_params
    params.require(:session).permit(:password, :email)
  end
end
