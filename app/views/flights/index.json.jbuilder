json.array!(@flights) do |flight|
  json.extract! flight, :airline, :departuretime, :flightnumber, :departureairport, :arrivalairport
  json.url flight_url(flight, format: :json)
end
