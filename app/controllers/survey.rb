get '/surveys' do
  @surveys = Survey.all
  erb :'/surveys/index'
end

get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  @round = @survey.rounds.create(user_id: current_user.id)
  @question = @survey.questions.first
  if @question == nil
    @question = Question.new
  end
  # @response = Response.new
  erb :'/surveys/show'
end

get '/surveys/:id/edit' do
  @survey = Survey.find_by(id: params[:id])
  @questions = @survey.questions || []
  erb :'/surveys/edit'
end

post '/surveys/:id/questions' do
  #ZM: WHY ARE YOU RENDERING ERBS IN POST METHODS?
  #ZM: REDIRECT INSTEAD ALWAYS
  @survey = Survey.find_by(id: params[:id])
  @survey.questions.create(text: params[:text])
  erb :'/surveys/partial', layout: false
end

post '/surveys' do
  #ZM: If you are redirecting correctly, there is no need for instance methods
  @survey = Survey.new(creator_id: session[:user_id], title: params[:title])
  if @survey.save
    redirect "/surveys/#{@survey.id}/edit"
  else
    redirect '/surveys'
  end
end

#ZM: Thumbs up
delete '/surveys/:id' do
  survey = Survey.find_by(id: params[:id])
  rounds = Round.where(survey_id: survey.id)
  if rounds
    #ZM: If you build your associations with a, dependent: destroy this will
    # Happen automatically
    rounds.each{|round| round.destroy}
    survey.destroy
  else
    survey.destroy
  end
  redirect '/surveys'
end

get '/surveys/:id/results' do
  @survey = Survey.find_by(id: params[:id])
  erb :'/surveys/results'
end
