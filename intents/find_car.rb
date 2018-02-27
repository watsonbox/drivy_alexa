intent "FindCarIntent" do
  p request.instance_variable_get("@request")['request']['intent']['slots']

  session = DrivyAlexa::Session.new(request)

  if (request.dialog_state != "COMPLETED")
    delegate_dialog
  else
    DrivyAlexa::ProgressiveResponse.new(request).respond("Searching")

    session.book_mode!

    search = DrivyAlexa::Search.new.tap do |search|
      search.perform(starts_at: session.starts_at, ends_at: session.ends_at)
    end

    first_car = search.cars.first
    first_car_year = first_car["display_specs"].split.first

    answer = "I found #{search.total_count} cars. "
    answer << "The closest is a #{first_car_year} #{first_car["title"]} for #{first_car["display_price"]}. "
    answer << "Shall I book it for you?"

    ask(answer, session_attributes: session.attributes)
  end
end
