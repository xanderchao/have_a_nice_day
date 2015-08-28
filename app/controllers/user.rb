get '/entry' do
  @user = User.new
  erb :'/users/new' #new is a login & signup page
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    redirect "/"
  else
    # flash[:error] = user.error.full_messages
    redirect '/entry'
  end
end

post '/login' do
  if User.authenticate(params[:user][:email], params[:user][:password])
    user = User.find_by(email: params[:user][:email])
    session[:user_id] = user.id
    redirect "/profile"
  else
    redirect "/entry"
  end
end

get "/profile" do
  if logged_in?
    @user = User.find_by(id: session[:user_id])
    erb :"users/show"
  else
    redirect "/entry"
  end
end

get "/logout" do
  session.clear
  redirect "/"
end
