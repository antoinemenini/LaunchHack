# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  phone           :integer
#  created_at      :datetime
#  updated_at      :datetime
#  password        :string(255)
#  password_digest :string(255)
#

class User < ActiveRecord::Base
	has_many :posts
	
	before_create :create_auth_token
	has_secure_password

	validates :name, :phone, :password, presence: true
	
	validates :email, presence: true
                   
  def User.new_auth_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_auth_token
    self.auth_token = User.encrypt(User.new_auth_token)
  end

  def contact
    @user = User.find(params[:id])
  end

  def send_message
    @user_contacted = User.find(params[:id])
    User_Mailer.send_message(current_user, @user_contacted, params[:message]).deliver
    flash[:success] = "Your message has been sent to #{@user_contacted}."
    redirect_to @user_contacted
  end


end
