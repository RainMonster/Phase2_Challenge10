get '/' do

  erb :index
end

get '/:username' do
  @graph = Koala::Facebook::API.new(ENV["FACEBOOK_ACCESS_CODE"])
  @username = params[:username]
  @user = @graph.get_object(@username)
  @name = @user["name"]
  @picture = @graph.get_picture(@username)
  erb :index
end

post '/post_to_facebook' do
  @graph = Koala::Facebook::API.new(ENV["FACEBOOK_ACCESS_CODE"])
  @me = @graph.get_object("me")
  @graph.put_wall_post(params["cool_post"])
  redirect '/'
end