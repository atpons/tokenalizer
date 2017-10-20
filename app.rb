require "sinatra"

get "/" do
  @file = File.open("token.txt", "r")
  @token = @file.read
  @mtime = @file.mtime
  @file.close
  erb :index
end

get "/token" do
  file = File.open("token.txt", "w+")
  file.puts rand(1000..9999)
  file.close
  redirect "/"
end
