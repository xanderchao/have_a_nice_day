get '/entry' do
  @user = User.new
  erb :'/users/entry'
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/profile"
  else
    flash[:errors] = user.errors.full_messages
    redirect '/entry'
  end
end

post '/login' do
  if User.authenticate(params[:user][:email], params[:user][:password])
    user = User.find_by(email: params[:user][:email])
    session[:user_id] = user.id
    redirect "/profile"
  else
    flash[:wrong_login] = "Your email or password was incorrect"
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
