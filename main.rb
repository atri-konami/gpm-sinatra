require "sinatra"
require "sinatra/reloader" if development?
require "twitter"
require "oauth"
require 'dotenv'
Dotenv.load

configure do
    use Rack::Session::Cookie, secret: Digest::SHA256.hexdigest(rand.to_s)
end

before do
    @consumer = OAuth::Consumer.new(
        ENV["CONSUMER_KEY"],
        ENV["CONSUMER_SECRET"],
        site: "https://api.twitter.com",
        authorize_path: "/oauth/authenticate"
    )
end

get "/" do
    session[:img_url] = params[:img_url]
    session[:text] = params[:text]
    request_token = @consumer.get_request_token(oauth_callback:ENV["CALLBACK"])
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    redirect to(request_token.authorize_url(oauth_callback:ENV["CALLBACK"]))
end

get "/auth/callback" do
    request_token = params['oauth_token']
    if request_token != session[:request_token]
        halt 400
    end

    request_token = OAuth::RequestToken.new(
        @consumer,
        session[:request_token],
        session[:request_token_secret]
    )

    access_token = request_token.get_access_token(oauth_verifier:params["oauth_verifier"])

    session[:access_token] = access_token.token
    session[:access_token_secret] = access_token.secret

    redirect to("/post")
end

get "/post" do
    erb :post
end

post "/post" do
    client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV["CONSUMER_KEY"]
        config.consumer_secret = ENV["CONSUMER_SECRET"]
        config.access_token = session[:access_token]
        config.access_token_secret = session[:access_token_secret]
    end

    text = URI.decode_www_form_component(params["text"])
    img_url = URI.parse(URI.decode_www_form_component(params["img_url"]))

    media_id = -1

    if ! img_url.request_uri.match(/default_album/)
        http = Net::HTTP.new(img_url.host, img_url.port)
        http.use_ssl = true
        req = Net::HTTP::Get.new(img_url.request_uri)
        res = http.request(req)
        Tempfile.open("img") {|f|
            f.write(res.body)
            f.rewind
            media_id = client.upload(f)
        }
    end

    opt = {}
    opt.merge!(media_ids: media_id) if media_id > 0
    client.update(text, opt)
    "Success!"
end
