# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :integer
#  created_at :datetime
#  updated_at :datetime
#  password   :string(255)
#

class User < ActiveRecord::Base
	validates :name, :phone, :password, presence: true
	has_many :posts
	validates :email, :presence => true
end
