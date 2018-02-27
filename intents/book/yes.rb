intent "AMAZON.YesIntent", session: { "mode" => "book" } do
  session = DrivyAlexa::Session.new(request)

  DrivyAlexa::ProgressiveResponse.new(request).respond("Booking")

  starts_at_string = session.starts_at.strftime("%F %H:%M")
  ends_at_string = session.ends_at.strftime("%F %H:%M")

  response = DrivyAlexa::Booking.new.perform(
    car_id: session.car_id,
    starts_at: session.starts_at,
    ends_at: session.ends_at
  )

  if response != 200
    tell("Oh gosh the booking failed. Sorry about that.")
  else
    tell("Okay, that's booked for you from #{starts_at_string} to #{ends_at_string}")
  end
end
