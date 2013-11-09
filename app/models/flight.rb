# == Schema Information
#
# Table name: flights
#
#  id               :integer          not null, primary key
#  airline          :string(255)
#  departuretime    :datetime
#  flightnumber     :string(255)
#  departureairport :string(255)
#  arrivalairport   :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Flight < ActiveRecord::Base
end
