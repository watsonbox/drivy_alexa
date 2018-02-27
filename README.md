# Drivy Alexa Skill

![Example conversation](https://raw.githubusercontent.com/watsonbox/drivy_alexa/master/res/example_conversation.jpg)

## Goals

Goal is to get a search and booking flow working. Main items:

- [x] Come up with a rough conversation flow
- [x] Design the interaction model (intents/slots etc)
- [x] Create the skill / interaction model in the Alexa Beta Console
- [ ] Use [Ralyxa](https://github.com/sjmog/ralyxa) and ngrok to get a simple Ruby service hooked up to the skill and working with the Alexa simulator
- [ ] Develop the full search and booking flow
- [ ] Modify the Drivy app (API) locally to use a hardcoded session
- [ ] Hook up the skill to the Drivy app to actually make bookings
- [ ] Add cards to the Alexa app when making a booking?
- [ ] Allow the user to ask for a cheaper/closer car? Or just another one?
- [ ] Allow the user to filter cars?
- [ ] Allow the user to list/cancel current bookings?

## Resources

- Official (recent) example skill with state which could serve as a template: https://github.com/alexa/skill-sample-nodejs-highlowgame
- [Ralyxa](https://github.com/sjmog/ralyxa): A Ruby framework for interacting with Amazon Alexa
- [Pizza Buddy](https://github.com/sjmog/pizza_buddy): Ralyxa example app

## Considertions

- What happens if the search date/time is in the past?