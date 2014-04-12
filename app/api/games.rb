get '/games/top' do
  json(GameService.top)
end
