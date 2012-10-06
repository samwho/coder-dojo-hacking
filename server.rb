require "bundler"
Bundler.require

MASTER_PASSWORD = '10000000'

get '/' do
  redirect '/usethesourceluke'
end

# HTML comment stage
get '/usethesourceluke' do
  haml :passwordinsource
end

post '/usethesourceluke' do
  if params[:password] && params[:password] == "EvilIsTheBest"
    redirect '/needleinahaystack'
  else
    redirect '/usethesourceluke'
  end
end

# Large leaked file full of hashed passwords
get '/needleinahaystack' do
  haml :leakedfile, :locals => {:validationerror=>false}
end

post '/needleinahaystack' do
  if params[:password] && params[:password].downcase == "password123"
    redirect '/nowyouseemenowyoudont'
  else
    haml :leakedfile, :locals => {:validationerror=>true}
  end
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
  response['X-PASSCODE-HINT'] = "Have a guess! Hints are shown after the first guess"
  haml :headers
end

post '/viewfromthetop' do
  passcode = 1337

  p = params[:passcode].to_i
  
  if p == passcode
    redirect '/0110'
  else
    if p > 0
      hint = p > passcode ? 'subtract ' + (p - passcode).to_s : 'add ' + (passcode - p).to_s
    else
      hint = "The passcode has 4 digits"
    end
  end

  response['X-PASSCODE-HINT'] = hint
  
  haml :headers
end

# Binary on/off password with check boxes
get '/0110' do
  haml :Binary
end

get '/dr_evils_secret_binary_notes' do
  haml :dr_evils_secret_binary_notes
end

# JS function to run in the console
get '/funktion' do
  haml :funktion
end

# the final countdown
get "/endoftheworld" do
  haml :countdown, layout: false
end

post "/savetheworld" do
  redirect('/endoftheworld') unless params[:password] == MASTER_PASSWORD
  haml :relax, layout: false
end
