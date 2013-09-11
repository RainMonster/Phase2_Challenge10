helpers do

  def authorize
    host_and_port = request.host
    host_and_port << ":9393" if request.host == "localhost"
    callback_url = "http://#{host_and_port}/auth"
    
    @oauth = Koala::Facebook::OAuth.new(ENV['FACEBOOK_API'], ENV['FACEBOOK_KEY'], callback_url)
    @oauth

    ## So Facebook requires that the callback_url be the server's IP and it
    # can't be localhost. Sadly, I'm not going to pay for a domain to test this
    # so it looks like my awesome app won't have this functionality. However
    # I left the set-up here for reference.

    # if protecting against cross-site request forgery, add :state =>  "RANDOMSTRING" to the hash
  end

end