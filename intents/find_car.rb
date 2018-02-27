intent "FindCarIntent" do
  p request.instance_variable_get("@request")['request']['intent']['slots']

  if (request.dialog_state != "COMPLETED")
    delegate_dialog
  else
    ask(
      "I found some cars. Shall I book one for you?",
      session_attributes: { mode: DrivyAlexa::MODES[:book] }
    )
  end
end
