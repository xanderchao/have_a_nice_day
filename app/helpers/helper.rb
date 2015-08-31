def logged_in?
  session[:user_id]
end

def current_user
  User.find_by(id: session[:user_id])
end

#ZM: This is not a help, at all, ever, in 1,000,000 years, if it was the last method on earth. 
#ZM: round.get_next_question
def get_question(round)
  survey = Survey.find_by(id: round.survey_id)
  all_questions = survey.questions
  responded = round.responses.all
  answered = responded.map {|response| response.choice.question}
  available = all_questions - answered
  available.sample
end