require "sinatra"
require "ralyxa"

require_relative "lib/drivy_alexa"

post "/" do
  Ralyxa::Skill.handle(request)
end
