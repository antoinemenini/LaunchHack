class SessionsController < ApplicationController
	def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
      return
    end
    link_user_with_visitor(user)
  end

  def destroy
    sign_out
    redirect_to root_url(no_tracker: true)
  end
end