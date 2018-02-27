intent "FindCarIntent" do
  p request.instance_variable_get("@request")['request']['intent']['slots']

  session = DrivyAlexa::Session.new(request)

  if (request.dialog_state != "COMPLETED")
    delegate_dialog
  else
    session.book_mode!

    ask(
      "I found some cars. Shall I book one for you?",
      session_attributes: session.attributes
    )
  end
end
