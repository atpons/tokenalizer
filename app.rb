require "sinatra"
require "dotenv"
require 'sinatra/reloader'

Dotenv.load

set :bind, '0.0.0.0'
set :port, 8888

get "/" do
  @file = File.open(ENV["file"], "r")
  @token = @file.read
  @mtime = @file.mtime
  @file.close
  erb :index
end

get "/token" do
  file = File.open(ENV["file"], "w+")
  file.puts rand(1000..9999)
  file.close
  redirect "/"
end
