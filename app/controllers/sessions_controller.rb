class SessionsController < ApplicationController
	def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
      return
    end
  end

  def destroy
    sign_out
    redirect_to root_url(no_tracker: true)
  end
end
