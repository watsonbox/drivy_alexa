require "sinatra"
require "ralyxa"
require "active_support"
require "active_support/core_ext/object"
require "ruby-duration"
require "httparty"

require_relative "lib/drivy_alexa"
require_relative "lib/drivy_alexa/session"
require_relative "lib/drivy_alexa/search"
require_relative "lib/drivy_alexa/progressive_response"

Ralyxa.configure do |config|
  config.validate_requests = false
end

post "/" do
  Ralyxa::Skill.handle(request)
end
