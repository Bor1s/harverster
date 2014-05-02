get '/events/daily_amount' do
  json(EventService.daily_events_amount)
end
