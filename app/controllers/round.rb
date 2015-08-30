#Player clicks on a game or link.
#That begins a round
#Player a clicks on a choice for a particular question
#That creates a Post route for a response. Redirect to the same page. Eventually we will implment ajax
#Player clicks complete survey button
#Once a player is complete with survey and clicks the submit button, genereates flash message

get '/rounds/:id' do
  @round = Round.find_by(id: params[:id])
  @question = get_question(@round)
  @response = Response.new
  if @question == nil
    erb :'/rounds/show'
  else

  end
end


# play button
post "/rounds" do
  @survey = Survey.find_by(id: params[:id])
  @round = @survey.rounds.new
  redirect "/rounds/#{round.id}"
end