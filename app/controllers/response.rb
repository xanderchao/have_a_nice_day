post "/rounds/:id/responses" do
  @choice = Choice.find_by(id: params[:choice])
  @choice.responses.create(round_id: params[:id])
  redirect "/rounds/#{params[:id]}"
end