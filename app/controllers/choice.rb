get "/questions/:id" do
  @question = Question.find_by(id: params[:id])
  @choices = @question.choices
  erb :'/questions/show'
end

post '/questions/:id/choices' do
  @question = Question.find_by(id: params[:id])
  @question.choices.create(text: params[:text])
  redirect "/questions/#{@question.id}"
end

