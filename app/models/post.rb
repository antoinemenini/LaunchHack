# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  flight_id   :integer
#  user_id     :integer
#  description :text
#  weight      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Post < ActiveRecord::Base
	belongs_to :flight
	belongs_to :user
	validates :flight, :user, presence: true
end
