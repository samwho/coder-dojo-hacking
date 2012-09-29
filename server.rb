require "bundler"
Bundler.require

MASTER_PASSWORD = 'password'

get '/' do
  haml :index
end

# HTML comment stage
get '/usethesourceluke' do
  haml :passwordinsource
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

get '/dr_evils_secret_binary_notes' do
  haml :dr_evils_secret_binary_notes
end

# JS function to run in the console
get '/funktion' do
  haml :function
end

# the final countdown
get "/endoftheworld" do
  haml :countdown, layout: false
end

post "/savetheworld" do
  redirect('/endoftheworld') unless params[:password] == MASTER_PASSWORD
  haml :relax, layout: false
end
