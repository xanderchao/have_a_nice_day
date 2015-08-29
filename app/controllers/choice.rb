get "/questions/:id" do
@question = Question.find_by(id: params[:id])
@choices = @question.choices
erb :'/questions/show'
end