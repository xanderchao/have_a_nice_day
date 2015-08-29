def logged_in?
  session[:user_id]
end

def current_user
  User.find_by(id: session[:user_id])
end

def get_question(round)
  survey = Survey.find_by(id: round.survey_id)
  all_questions = survey.questions
  responded = round.responses.all
  answered = responded.map {|response| response.choice.question}
  available = all_questions - answered
  available.first
end