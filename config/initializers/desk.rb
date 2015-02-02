require "rubygems"
require "oauth"

consumer = OAuth::Consumer.new(
  ENV["DESK_API_CONSUMER_KEY"],
  ENV["DESK_API_CONSUMER_SECRET"],
  site: "https://#{ENV['DESK_NAME']}.desk.com",
  scheme: :header
)

DeskApi = OAuth::AccessToken.from_hash(
  consumer,
  oauth_token: ENV["DESK_ACCESS_TOKEN"],
  oauth_token_secret: ENV["DESK_ACCESS_TOKEN_SECRET"]
)

DeskApiRoot = "https://#{ENV['DESK_NAME']}.desk.com/api/v2"
