require "bundler"
Bundler.require

get '/' do
  haml :index
end

# HTML comment stage
get '/requestforcomment' do
  haml :htmlcomment
end

# Large leaked file full of hashed passwords
get '/needleinahaystack' do
  haml :leakedfile
end

# Hidden in an image
get '/nowyouseemenowyoudont' do
  haml :hiddenimage
end

# Book cipher
get '/onceuponatime' do
  haml :bookcipher
end

# Encrypted message in headers
get '/viewfromthetop' do
  haml :headers
end

# Binary on/off password with check boxes
get '/0110' do
  haml :binary
end

# JS function to run in the console
get '/funktion' do
  haml :function
end
