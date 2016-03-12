require 'byebug'

get '/' do
  # Look in app/views/index.erb
  @urls = Url.all
  p @urls
  erb :index
end



post '/url/create' do

  @input = SecureRandom.hex(5)
  @url = Url.create(long_url:params['long_url'], short_url:@input, counter: 0)
  @urltf1 = @url.save
erb :url
end

get '/:short_url' do
# puts params
# redirect to appropriate "long" URL
  url = Url.where(short_url: params[:short_url]).first
  url.counter += 1
  url.save
  redirect to url.long_url
end