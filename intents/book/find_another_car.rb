intent "FindAnotherCarIntent", session: { "mode" => "book" } do
  session = DrivyAlexa::Session.new(request)

  # We could make this quicker by saving the results instead
  DrivyAlexa::ProgressiveResponse.new(request).respond("Let me see")

  search = DrivyAlexa::Search.new.tap do |search|
    search.perform(starts_at: session.starts_at, ends_at: session.ends_at)
  end

  next_car = search.car_after_id(session.car_id)
  next_car_year = next_car["display_specs"].split.first

  session.car!(next_car["id"])

  answer = "How about a #{next_car_year} #{next_car["title"]} for #{next_car["display_price"]}. "
  answer << "Shall I book this one?"

  ask(answer, session_attributes: session.attributes)
end
