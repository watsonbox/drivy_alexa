require "sinatra"
require "ralyxa"
require "active_support"
require "active_support/core_ext/object"

require_relative "lib/drivy_alexa"
require_relative "lib/drivy_alexa/session"

post "/" do
  Ralyxa::Skill.handle(request)
end
