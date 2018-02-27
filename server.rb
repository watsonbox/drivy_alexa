require "sinatra"
require "ralyxa"
require "active_support"
require "active_support/core_ext/object"
require "ruby-duration"

require_relative "lib/drivy_alexa"
require_relative "lib/drivy_alexa/session"

Ralyxa.configure do |config|
  config.validate_requests = false
end

post "/" do
  Ralyxa::Skill.handle(request)
end
