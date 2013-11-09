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
                   


end
