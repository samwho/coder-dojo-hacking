require "bundler"
Bundler.require

MASTER_PASSWORD = 'password'

get '/' do
  redirect '/usethesourceluke'
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

post '/nowyouseemenowyoudont' do
  if params[:password] && params[:password].downcase == "baby bell"
    redirect '/onceuponatime'
  else
    redirect '/nowyouseemenowyoudont'
  end
end

# Book cipher
get '/onceuponatime' do
  haml :bookcipher
end

post '/onceuponatime' do
  if params[:password] && params[:password].downcase == "hacking into things"
    redirect '/viewfromthetop'
  else
    redirect '/onceuponatime'
  end
end

# Encrypted message in headers
get '/viewfromthetop' do
  haml :headers
end

post '/viewfromthetop' do
  passcode = 1337

  p = params[:passcode].to_f
  
  if p == passcode
    redirect '/0110'
  else
    hint = p > passcode ? 'high' : 'small'
  end
  response['X-PASSCODE-HINT'] = "The number you entered is too " + hint
  haml :headers
end

# Binary on/off password with check boxes
get '/0110' do
  haml :Binary
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