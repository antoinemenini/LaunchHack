module SessionsHelper
	def sign_in(user)
    # create new token
    auth_token = User.new_auth_token

    # place newly created token in the browser cookie
    cookies.permanent[:auth_token] = auth_token
    cookies.permanent[:user_id] = user.id

    # save the encrypted token to db
    user.update_attribute(:auth_token, User.encrypt(auth_token))
    self.current_user = user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:auth_token)
  end

  # creates a distinct token to identify non logged in visitors
  # on mixpanel
  def visitor_token
    if cookies[:visitor_token]
      visitor_token = cookies[:visitor_token]
    else
      visitor_token = User.new_auth_token
      cookies[:visitor_token] = visitor_token
    end
    visitor_token
  end

  def link_user_with_visitor(user)
    if cookies[:visitor_token]
      visitor_token = cookies.delete(:visitor_token)
      mixpanel.alias(user.id, visitor_token)
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    auth_token = User.encrypt(cookies[:auth_token])
    @current_user ||= User.find_by(auth_token: auth_token)
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      store_location
      flash[:warning] = "Please sign in."
      redirect_to signin_url
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

end
