get '/' do
  @user = User.new
  if logged_in?
    redirect '/surveys'
  else
    erb :'/users/entry'
  end
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/profile"
  else
    flash[:errors] = user.errors.full_messages
    redirect '/'
  end
end

post '/login' do
  if User.authenticate(params[:user][:email], params[:user][:password])
    user = User.find_by(email: params[:user][:email])
    session[:user_id] = user.id
    redirect "/surveys"
  else
    flash[:wrong_login] = "Your email or password was incorrect"
    redirect "/"
  end
end

get "/profile" do
  if logged_in?
    @user = User.find_by(id: session[:user_id])
    @surveys_created = @user.surveys || []
    @surveys_taken = @user.rounds || []
    erb :"users/show"
  else
    redirect "/"
  end
end

get "/logout" do
  session.clear
  redirect "/"
end
