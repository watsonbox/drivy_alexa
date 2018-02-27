intent "AMAZON.YesIntent", session: { "mode" => "book" } do
  session = DrivyAlexa::Session.new(request)

  tell("Okay, that's booked for you")
end
