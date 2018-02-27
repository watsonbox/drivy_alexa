intent "AMAZON.YesIntent", session: { "mode" => "book" } do
  session = DrivyAlexa::Session.new(request)

  starts_at_string = session.starts_at.strftime("%F %H:%M")
  ends_at_string = session.ends_at.strftime("%F %H:%M")

  tell("Okay, that's booked for you from #{starts_at_string} to #{ends_at_string}")
end
